import { createFileRoute } from '@tanstack/react-router'
import { Card } from "@/components/ui/card"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Badge } from "@/components/ui/badge"
import AssignmentDetail from '@/components/AssignmentDetail'
// import DiscussionList from '@/components/DiscussionList'

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/announcements/$announcementId/',
)({
  component: RouteComponent,
})

function RouteComponent() {


  return (
    <Card className="p-6">
      <div className="p-6 space-y-6">
        {/* Header */}
        <div className="space-y-2">
          <h1 className="text-2xl font-semibold">
            Roadmap Planning: From Vision to Prioritisation
          </h1>

          <div className="flex flex-wrap items-center gap-2 text-sm text-muted-foreground">
            <span>Prof. Anvesh Jain</span>
            <span>•</span>
            <span>13 Jan, 12:00 PM</span>
          </div>

          <div className="flex flex-wrap gap-2 pt-2">
            <Badge variant="secondary">General</Badge>
            <Badge variant="secondary">Practice</Badge>
            <Badge variant="secondary">Recommended</Badge>
            <Badge variant="secondary">Module 1</Badge>
          </div>
        </div>

        {/* Tabs */}
        <Tabs defaultValue="details" className="w-full">
          <TabsList>
            <TabsTrigger value="details">Assignment Details</TabsTrigger>
          </TabsList>

          {/* Assignment Details */}
          <TabsContent value="details">
            <AssignmentDetail />
          </TabsContent>
        </Tabs>
      </div>
    </Card>
  )
}