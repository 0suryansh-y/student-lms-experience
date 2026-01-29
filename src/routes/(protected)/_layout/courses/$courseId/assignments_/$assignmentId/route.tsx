import { Link, Outlet, createFileRoute, getRouteApi } from '@tanstack/react-router'
import { Badge } from "@/components/ui/badge"
import { fetchAssignmentById } from '@/server/assignments/fetchAssignmentById'
import { cn } from "@/lib/utils"

const linkBase =
  "px-4 py-2 rounded-md text-sm font-medium transition-colors"

const linkInactive =
  "text-muted-foreground hover:text-foreground hover:bg-muted"

const linkActive =
  "bg-primary text-primary-foreground shadow-sm"

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/assignments_/$assignmentId',
)({
  component: RouteComponent,
  loader: async ({ params }) => {
    const assignmentId = Number(params.assignmentId)

    const assignmentData = await fetchAssignmentById({
      data: { assignmentId },
    })

    return { assignmentData }
  }
})

function RouteComponent() {

  const data = Route.useLoaderData();

  const { useParams } = getRouteApi('/(protected)/_layout/courses/$courseId/assignments_/$assignmentId')

  const { courseId, assignmentId } = useParams()

  const { assignmentData } = data;

  return (
    <div className="p-6 space-y-6">
      {/* Header */}
      <div className="space-y-2">
        <h1 className="text-2xl font-semibold">
          {assignmentData[0].title}
        </h1>

        <div className="flex flex-wrap items-center gap-2 text-sm text-muted-foreground">
          <span>

            {assignmentData[0].type}
          </span>
          <span>•</span>
          <span>{assignmentData[0].category}</span>
        </div>

        <div className="flex flex-wrap gap-2 pt-2">
          <Badge variant="secondary">General</Badge>
          <Badge variant="secondary">Practice</Badge>
          <Badge variant="secondary">Recommended</Badge>
          <Badge variant="secondary">Module 1</Badge>
        </div>
      </div>

      <div className="flex gap-2">
        <Link
          to="/courses/$courseId/assignments/$assignmentId"
          params={{ courseId, assignmentId }}
          className={cn(linkBase, linkInactive)}
          activeOptions={{ exact: true }} // 👈 IMPORTANT
          activeProps={{
            className: cn(linkBase, linkActive),
          }}
        >
          Assignment
        </Link>

        <Link
          to="/courses/$courseId/assignments/$assignmentId/discussions"
          params={{ courseId, assignmentId }}
          search={{ page: undefined }}
          className={cn(linkBase, linkInactive)}
          activeOptions={{ exact: false }} // optional, default
          activeProps={{
            className: cn(linkBase, linkActive),
          }}
        >
          Discussions
        </Link>

      </div>

      <Outlet />
    </div>
  )
}