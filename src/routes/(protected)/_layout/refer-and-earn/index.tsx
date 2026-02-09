import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute('/(protected)/_layout/refer-and-earn/')({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/(protected)/_layout/refer-and-earn/"!</div>
}
