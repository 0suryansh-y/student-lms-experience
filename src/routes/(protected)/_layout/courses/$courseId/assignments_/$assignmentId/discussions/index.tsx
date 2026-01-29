import { Link, createFileRoute } from '@tanstack/react-router'
import { Card } from '@/components/ui/card'
import FilterAndSeachBar from '@/components/FilterAndSeachBar'
import { PAGINATION_PAGE_SIZE } from '@/globalSettings'
import AppPagination from '@/components/Pagination'
import SkeletonCommon from '@/components/SkeletonCommon'

import {
    getCurrentPage,
    getTotalPages
} from '@/utils/pagination'
import { createPageSetter } from '@/utils/routerPagination'
import { Button } from '@/components/ui/button'
import { DiscussionCard } from '@/components/DiscussionCard'
import { fetchAllDiscussions } from '@/server/discussions/fetchAllDiscussions'
import { fetchAllDiscussionsCount } from '@/server/discussions/fetchAllDiscussionsCount'


export const Route = createFileRoute(
    '/(protected)/_layout/courses/$courseId/assignments_/$assignmentId/discussions/',
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
                    <h2 className="text-2xl font-semibold">Discussions</h2>
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
        const { assignmentId } = params

        const discussionList = await fetchAllDiscussions({
            data: { entityId: JSON.parse(assignmentId), entityType: 'Assignment', page: page },
        })
        const rowsCount = await fetchAllDiscussionsCount({
            data: { entityId: JSON.parse(assignmentId), entityType: 'Assignment' }
        })

        return { rowsCount, discussionList }
    }
})

function RouteComponent() {
    const { courseId, assignmentId } = Route.useParams()
    const { page } = Route.useSearch()
    const navigate = Route.useNavigate()

    const currentPage = getCurrentPage(page)
    const setPage = createPageSetter(navigate)

    const { rowsCount, discussionList } = Route.useLoaderData()

    const totalPages = getTotalPages(
        rowsCount,
        PAGINATION_PAGE_SIZE,
    )

    return (
        <Card className="p-6">
            <div className="space-y-6">
                <div className="flex items-center justify-between">
                    <h2 className="text-2xl font-semibold">Discussions</h2>
                    <Link to='/courses/$courseId/assignments/$assignmentId/discussions/create' params={{ courseId, assignmentId }}>
                        <Button size="lg" className="rounded-lg px-8">
                            Create New
                        </Button>
                    </Link>
                </div>

                <FilterAndSeachBar />

                <div className="space-y-4">
                    {discussionList.map((discussion, key) => (
                        <DiscussionCard
                            key={key}
                            discussion={discussion}
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
