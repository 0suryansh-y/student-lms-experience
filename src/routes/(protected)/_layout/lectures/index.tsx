import { createFileRoute } from '@tanstack/react-router'
import { LectureCard } from '@/components/LectureCard'
import FilterAndSeachBar from '@/components/FilterAndSeachBar'
import { PAGINATION_PAGE_SIZE } from '@/globalSettings'
import AppPagination from '@/components/Pagination'
import SkeletonCommon from '@/components/SkeletonCommon'

import {
  getCurrentPage,
  getTotalPages,
} from '@/utils/pagination'
import { createPageSetter } from '@/utils/routerPagination'
import { fetchAllLectures } from '@/server/lectures/fetchAllLectures'
import { fetchAllLecturesCount } from '@/server/lectures/fetchAllLecturesCount'


export const Route = createFileRoute(
  '/(protected)/_layout/lectures/',
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
      <div className="p-6 space-y-6">
        {/** TODO: Drop this H2 and FilterAndSeach component in a _layout */}
        <h2 className="text-2xl font-semibold">Lectures</h2>
        <FilterAndSeachBar />
        {Array.from({ length: PAGINATION_PAGE_SIZE }).map((_, i) => (
          <SkeletonCommon key={i} />
        ))}
      </div>
    )
  },
  loaderDeps: ({ search: { page } }) => ({ page }),

  loader: async ({ deps, context }) => {
      const { page } = deps
      const { user } = context
      const lectureList = await fetchAllLectures({
        data: { userId: user.id, batchId: null, page: page },
      })
      const rowsCount = await fetchAllLecturesCount({
        data: { userId: context.user.id, batchId: null }
      })
  
      return { rowsCount, lectureList }
    }
  })

function RouteComponent() {
  const { page } = Route.useSearch()
  const navigate = Route.useNavigate()

  const currentPage = getCurrentPage(page)
  const setPage = createPageSetter(navigate)

  const { rowsCount, lectureList } = Route.useLoaderData()

  const totalPages = getTotalPages(
    rowsCount,
    PAGINATION_PAGE_SIZE,
  )

  return (
    <div className="p-6 space-y-6">
      <h2 className="text-2xl font-semibold">Lectures</h2>

      <FilterAndSeachBar />
      <div className="space-y-4">
        {lectureList.map((lecture, key) => (
          <LectureCard
            key={key}
            lecture={lecture}
          />
        ))}
      </div>

      <AppPagination
        currentPage={currentPage}
        totalPages={totalPages}
        onPageChange={setPage}
      />
    </div>
  )
}

