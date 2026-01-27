import { createFileRoute } from '@tanstack/react-router'
import { useQuery } from '@tanstack/react-query'
import { Card } from '@/components/ui/card'
import FilterAndSeachBar from '@/components/FilterAndSeachBar'
import { PAGINATION_PAGE_SIZE } from '@/globalSettings'
import AppPagination from '@/components/Pagination'
import SkeletonCommon from '@/components/SkeletonCommon'

import {
  getCurrentPage,
  getTotalPages,
  paginate,
} from '@/utils/pagination'
import { createPageSetter } from '@/utils/routerPagination'
import { AnnouncementCard } from '@/components/AnnouncementCard'
import { fetchAllAnnouncementsByCourseId } from '@/server/announcements/fetchAllAnnouncementsByCourseId'

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/announcements/',
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
})

function RouteComponent() {
  const { courseId } = Route.useParams()
  const { page } = Route.useSearch()
  const navigate = Route.useNavigate()

  const currentPage = getCurrentPage(page)
  const setPage = createPageSetter(navigate)

  const {
    data: announcements = [],
    isLoading,
    isError,
  } = useQuery({
    queryKey: ['announcements', courseId],
    queryFn: () => fetchAllAnnouncementsByCourseId(courseId),
  })

  const totalPages = getTotalPages(
    announcements.length,
    PAGINATION_PAGE_SIZE,
  )

  const paginatedAnnouncements = paginate(
    announcements,
    currentPage,
    PAGINATION_PAGE_SIZE,
  )

  return (
    <Card className="p-6">
      <div className="space-y-6">
        <h2 className="text-2xl font-semibold">Announcements</h2>

        <FilterAndSeachBar />

        {isLoading && (
          <div className="space-y-4">
            {Array.from({ length: 3 }).map((_, i) => (
              <SkeletonCommon key={i} />
            ))}
          </div>
        )}

        {isError && (
          <p className="text-sm text-destructive">
            Failed to load announcements
          </p>
        )}

        {!isLoading && !isError && (
          <div className="space-y-4">
            {paginatedAnnouncements.map(({ id, ...rest }) => (
              <AnnouncementCard
                key={id}
                {...rest}
                params={{
                  courseId,
                  announcementId: String(id),
                }}
              />
            ))}
          </div>
        )}

        <AppPagination
          currentPage={currentPage}
          totalPages={totalPages}
          onPageChange={setPage}
        />
      </div>
    </Card>
  )
}
