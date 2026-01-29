import { createFileRoute } from '@tanstack/react-router'
import FilterAndSeachBar from '@/components/FilterAndSeachBar'
import { PAGINATION_PAGE_SIZE } from '@/globalSettings'
import AppPagination from '@/components/Pagination'
import SkeletonCommon from '@/components/SkeletonCommon'

import {
  getCurrentPage,
  getTotalPages,
} from '@/utils/pagination'
import { createPageSetter } from '@/utils/routerPagination'
import { fetchAllAnnouncements } from '@/server/announcements/fetchAllAnnouncement'
import { fetchAllAnnouncementCount } from '@/server/announcements/fetchAllAnnouncementCount'
import { AnnouncementCard } from '@/components/AnnouncementCard'
import { Card } from '@/components/ui/card'

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/_courseTabLayout/announcements/',
)({
  validateSearch: (search) => {
    const page =
      typeof search.page === 'number'
        ? search.page
        : Number(search.page)

    return {
      page: page && page > 0 ? page : undefined,
    }
  },
  component: RouteComponent,
  pendingComponent: () => {
    return (
      <Card className="p-6">
        <div className="space-y-6">
          {/** TODO: Drop this H2 and FilterAndSeach component in a _layout */}
          <h2 className="text-2xl font-semibold">Announcements</h2>
          <FilterAndSeachBar />
          {Array.from({ length: PAGINATION_PAGE_SIZE }).map((_, i) => (
            <SkeletonCommon key={i} />
          ))}
        </div>
      </Card>
    )
  },
  loaderDeps: ({ search: { page } }) => ({ page }),
  loader: async ({ deps, params }) => {
    const { page } = deps
    const { courseId } = params
    const announcementList = await fetchAllAnnouncements({
      data: { batchId: JSON.parse(courseId), page: page },
    })
    const rowsCount = await fetchAllAnnouncementCount({
      data: { batchId: JSON.parse(courseId) }
    })

    return { rowsCount, announcementList }
  }
})

function RouteComponent() {
  const { page } = Route.useSearch()
  const navigate = Route.useNavigate()

  const currentPage = getCurrentPage(page)
  const setPage = createPageSetter(navigate)

  const { rowsCount, announcementList } = Route.useLoaderData()

  const totalPages = getTotalPages(
    rowsCount,
    PAGINATION_PAGE_SIZE,
  )

  return (
    <Card className='p-6'>
      <div className="space-y-6">
        <h2 className="text-2xl font-semibold">Announcements</h2>

        <FilterAndSeachBar />


        <div className="space-y-4">
          {announcementList.map((announcement, key) => (
            <AnnouncementCard
              key={key}
              announcement={announcement}
            />
          ))}
        </div>


        <AppPagination
          currentPage={currentPage}
          totalPages={totalPages}
          onPageChange={setPage}
        />
      </div>
    </Card>
  )
}
