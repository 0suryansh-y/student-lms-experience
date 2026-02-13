import { createFileRoute } from '@tanstack/react-router'
import { ZoomMeeting } from '@/components/ZoomMeeting'

export const Route = createFileRoute('/(protected)/zoom/')({
  component: RouteComponent,
})

function RouteComponent() {
  return(
    <ZoomMeeting />
  )
}
