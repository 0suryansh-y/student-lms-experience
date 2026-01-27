import { Link, createFileRoute } from '@tanstack/react-router'
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
import { Button } from '@/components/ui/button'
import { DiscussionCard } from '@/components/DiscussionCard'
import { fetchFiveDiscussions } from '@/server/discussions/fetchFiveDiscussions'

export type DiscussionData = Awaited<ReturnType<typeof fetchFiveDiscussions>>;
export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/discussions/',
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
  staleTime:1200,

  // loader: async () => {
  //   // TanStack Server Functions return the data directly or wrapped 
  //   // depending on your version, but usually it's the direct return.
  //   const data = await fetchFiveDiscussions();

  //   return { 
  //     discussionsData: data 
  //   };
  // },
})

function RouteComponent() {
  const { courseId } = Route.useParams()
  const { page } = Route.useSearch()
  const navigate = Route.useNavigate()

  const currentPage = getCurrentPage(page)
  const setPage = createPageSetter(navigate)


  // const res = Route.useLoaderData();

  // console.log(res?.discussionsData)


  const {
    data: discussions = [],
    isLoading,
    isError,
  } = useQuery({
    queryKey: ['discussion', courseId],
    queryFn: () => fetchFiveDiscussions(),
  })

  const totalPages = getTotalPages(
    discussions.length,
    PAGINATION_PAGE_SIZE,
  )

  const paginatedDiscussions = paginate(
    discussions,
    currentPage,
    PAGINATION_PAGE_SIZE,
  )

  return (
    <Card className="p-6">
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <h2 className="text-2xl font-semibold">Discussions</h2>
          <Link to='/courses/$courseId/discussions/create' params={{ courseId }}>
            <Button size="lg" className="rounded-lg px-8">
              Create New
            </Button>
          </Link>
        </div>

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
            Failed to load discussions
          </p>
        )}

        {!isLoading && !isError && (
          <div className="space-y-4">
            {paginatedDiscussions.map((discussion) => (
              <DiscussionCard
                key={discussion.id}
                {...discussion} // pass all props including id
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
