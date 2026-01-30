import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute(
  '/(protected)/_layout/support/$supportId/',
)({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/(protected)/_layout/support/$supportId/"!</div>
}
