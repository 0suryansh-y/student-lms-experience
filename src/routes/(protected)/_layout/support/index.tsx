import { createFileRoute } from "@tanstack/react-router"

export const Route = createFileRoute('/(protected)/_layout/support/')({
  component: RouteComponent,
})

function RouteComponent() {
  return (
    <h1>Support Page UI</h1>
  )
}

