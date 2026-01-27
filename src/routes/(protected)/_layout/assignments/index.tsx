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
import { fetchAllAssignments } from '@/server/assignments/fetchAllAssignments'
import { AssignmentCard } from '@/components/AssignmentCard'

export const Route = createFileRoute(
  '/(protected)/_layout/assignments/',
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
  const { page } = Route.useSearch()
  const navigate = Route.useNavigate()

  const currentPage = getCurrentPage(page)
  const setPage = createPageSetter(navigate)

  const {
    data: assignments = [],
    isLoading,
    isError,
  } = useQuery({
    queryKey: ['assignments'],
    queryFn: () => fetchAllAssignments(),
  })

  const courseId = '5'

  const totalPages = getTotalPages(
    assignments.length,
    PAGINATION_PAGE_SIZE,
  )

  const paginatedAssignments = paginate(
    assignments,
    currentPage,
    PAGINATION_PAGE_SIZE,
  )

  return (
    <Card className="p-6">
      <div className="space-y-6">
        <h2 className="text-2xl font-semibold">Assignments</h2>

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
            Failed to load assignments
          </p>
        )}

        {!isLoading && !isError && (
          <div className="space-y-4">
            {paginatedAssignments.map(({ id, ...rest }) => (
              <AssignmentCard
                key={id}
                {...rest}
                params={{
                  courseId,
                  assignmentId: String(id),
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
