import { createFileRoute } from '@tanstack/react-router'
import { useQuery } from '@tanstack/react-query'
import { LectureCard } from '@/components/LectureCard'
import { Card } from '@/components/ui/card'
import FilterAndSeachBar from '@/components/FilterAndSeachBar'
import { fetchAllLecturesByCourseId } from '@/server/lectures/fetchAllLecturesByCourseId'
import { PAGINATION_PAGE_SIZE } from '@/globalSettings'
import AppPagination from '@/components/Pagination'
import SkeletonCommon from '@/components/SkeletonCommon'

import {
  getCurrentPage,
  getTotalPages,
  paginate,
} from '@/utils/pagination'
import { createPageSetter } from '@/utils/routerPagination'

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/lectures/',
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
    data: lectures = [],
    isLoading,
    isError,
  } = useQuery({
    queryKey: ['lectures', courseId],
    queryFn: () => fetchAllLecturesByCourseId(courseId),
  })

  const totalPages = getTotalPages(
    lectures.length,
    PAGINATION_PAGE_SIZE,
  )

  const paginatedLectures = paginate(
    lectures,
    currentPage,
    PAGINATION_PAGE_SIZE,
  )

  return (
    <Card className="p-6">
      <div className="space-y-6">
        <h2 className="text-2xl font-semibold">Lectures</h2>

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
            Failed to load lectures
          </p>
        )}

        {!isLoading && !isError && (
          <div className="space-y-4">
            {paginatedLectures.map(({ id, ...rest }) => (
              <LectureCard
                key={id}
                {...rest}
                params={{
                  courseId,
                  lectureId: String(id),
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
