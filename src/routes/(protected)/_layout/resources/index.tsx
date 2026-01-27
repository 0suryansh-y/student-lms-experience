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
import { ResourceCard } from '@/components/ResourcesCard'
import { fetchAllResources } from '@/server/resources/fetchAllResources'

export const Route = createFileRoute(
  '/(protected)/_layout/resources/',
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
    data: resources = [],
    isLoading,
    isError,
  } = useQuery({
    queryKey: ['resources'],
    queryFn: () => fetchAllResources(),
  })

  // courseId should be fetched using useQuery
  const courseId = '1'

  const totalPages = getTotalPages(
    resources.length,
    PAGINATION_PAGE_SIZE,
  )

  const paginatedResources = paginate(
    resources,
    currentPage,
    PAGINATION_PAGE_SIZE,
  )

  return (
    <Card className="p-6">
      <div className="space-y-6">
        <h2 className="text-2xl font-semibold">Resources</h2>

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
            Failed to load Resources
          </p>
        )}

        {!isLoading && !isError && (
          <div className="space-y-4">
            {paginatedResources.map(({ id, ...rest }) => (
              <ResourceCard
                key={id}
                {...rest}
                params={{
                  courseId,
                  resourceId: String(id),
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
