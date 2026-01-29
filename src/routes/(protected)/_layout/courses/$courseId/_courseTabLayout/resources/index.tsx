import { createFileRoute } from '@tanstack/react-router'
import { Card } from '@/components/ui/card'
import FilterAndSeachBar from '@/components/FilterAndSeachBar'
import { PAGINATION_PAGE_SIZE } from '@/globalSettings'
import AppPagination from '@/components/Pagination'
import SkeletonCommon from '@/components/SkeletonCommon'

import {
  getCurrentPage,
  getTotalPages,
} from '@/utils/pagination'
import { createPageSetter } from '@/utils/routerPagination'
import { ResourceCard } from '@/components/ResourcesCard'
import { fetchAllResources } from '@/server/resources/fetchAllResources'
import { fetchAllResourcesCount } from '@/server/resources/fetchAllResourcesCount'

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/_courseTabLayout/resources/',
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
      <Card className='p-6'>
        <div className="space-y-6">
          {/** TODO: Drop this H2 and FilterAndSeach component in a _layout */}
          <h2 className="text-2xl font-semibold">Resources</h2>
          <FilterAndSeachBar />
          {Array.from({ length: PAGINATION_PAGE_SIZE }).map((_, i) => (
            <SkeletonCommon key={i} />
          ))}
        </div>
      </Card>
    )
  },
  loaderDeps: ({ search: { page } }) => ({ page }),
  loader: async ({ deps, context, params }) => {
    const { page } = deps
    const { user } = context
    const { courseId } = params

    const resourcesList = await fetchAllResources({
      data: { userId: user.id, batchId: JSON.parse(courseId), page: page },
    })
    const rowsCount = await fetchAllResourcesCount({
      data: { userId: context.user.id, batchId: JSON.parse(courseId) }
    })

    return { rowsCount, resourcesList }
  }
})

function RouteComponent() {
  const { page } = Route.useSearch()
  const navigate = Route.useNavigate()

  const currentPage = getCurrentPage(page)
  const setPage = createPageSetter(navigate)


  const { rowsCount, resourcesList } = Route.useLoaderData()

  const totalPages = getTotalPages(
    rowsCount,
    PAGINATION_PAGE_SIZE,
  )


  return (
    <Card className="p-6">
      <div className="space-y-6">
        <h2 className="text-2xl font-semibold">Resources</h2>

        <FilterAndSeachBar />

        <div className="space-y-4">
          {resourcesList.map((resource, key) => (
            <ResourceCard
              key={key}
              resource={resource}
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
