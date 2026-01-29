import { Outlet, createFileRoute, redirect } from "@tanstack/react-router"
import Header from "@/components/Header"

export const Route = createFileRoute("/(protected)/_layout")({
  beforeLoad: ({ context }) => {
    if (!context.user) {
      console.log("No user found, redirecting to login", context.user)
      throw redirect({ to: "/login" })
    }
    return {
      user: context.user,
    }

  },
  component: RouteComponent,
  pendingComponent: () => <div>Loading...</div>
})


function RouteComponent() {
  return (
    <div className="min-h-screen bg-background">
      <Header />
      <main>
        <Outlet />
      </main>
    </div>
  )
}
