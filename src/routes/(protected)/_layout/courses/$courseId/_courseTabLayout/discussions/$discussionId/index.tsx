import { createFileRoute } from '@tanstack/react-router'
import ViewDiscussion from '@/components/ViewDiscussion'

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/_courseTabLayout/discussions/$discussionId/',
)({
  component: RouteComponent,
})

function RouteComponent() {
  return (
    <ViewDiscussion />
  )
}
