import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute(
  '/(protected)/_layout/practice-interview/',
)({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/(protected)/_layout/practice-interview/"!</div>
}
