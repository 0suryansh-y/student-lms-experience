import { createFileRoute } from '@tanstack/react-router'
import Dashboard from '@/components/Dashboard'

export const Route = createFileRoute('/(protected)/_layout/')({ component: App })

function App() {

  return (
    <div className="min-h-screen">
        <Dashboard/>
    </div>
  )
}
