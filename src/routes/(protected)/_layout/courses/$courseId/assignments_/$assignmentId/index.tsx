import { createFileRoute } from '@tanstack/react-router'
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import AssignmentDetail from '@/components/AssignmentDetail'


export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/assignments_/$assignmentId/',
)({
  component: RouteComponent,
})

function RouteComponent() {
  return (
    // <TabsContent value="assignment" className="pt-4">
          <AssignmentDetail />
        // </TabsContent>
  )
}
