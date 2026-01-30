import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute('/(protected)/_layout/bookmark/')({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/(protected)/_layout/bookmark/"!</div>
}
