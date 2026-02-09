import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute('/(protected)/_layout/chat/')({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/(protected)/_layout/chat/"!</div>
}
