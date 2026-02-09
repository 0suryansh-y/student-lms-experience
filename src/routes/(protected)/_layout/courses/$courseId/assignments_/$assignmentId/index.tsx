import { createFileRoute, getRouteApi } from '@tanstack/react-router'
import AssignmentDetail from '@/components/AssignmentDetail'

const parentRoute = getRouteApi(
  '/(protected)/_layout/courses/$courseId/assignments_/$assignmentId'
)

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/assignments_/$assignmentId/',
)({
  component: RouteComponent,
})

function RouteComponent() {

    const { assignmentData } = parentRoute.useLoaderData()

  return (
      <AssignmentDetail data={assignmentData[0]}/>
  )
}
