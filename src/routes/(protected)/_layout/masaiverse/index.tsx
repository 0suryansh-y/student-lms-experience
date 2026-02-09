import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute('/(protected)/_layout/masaiverse/')({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/(protected)/_layout/masaiverse/"!</div>
}
