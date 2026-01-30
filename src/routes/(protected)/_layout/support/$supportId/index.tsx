import { createFileRoute } from '@tanstack/react-router'
import { fetchTicketById } from '@/server/tickets/fetchTicketById'
import { Card } from '@/components/ui/card'


export const Route = createFileRoute(
  '/(protected)/_layout/support/$supportId/',
)({
  component: RouteComponent,
  loader: async ({ params }) => {
    const ticketId = Number(params.supportId)

    const ticketData = await fetchTicketById({
      data: { ticketId },
    })
    return { ticketData }
  }
})

function RouteComponent() {

  const data = Route.useLoaderData();

  const { ticketData } = data;

  return (
    <>
    <Card className='p-6'>
      {JSON.stringify(ticketData[0])}
    </Card>
    </>
  )
}
