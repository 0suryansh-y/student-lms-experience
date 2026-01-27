import { createFileRoute } from "@tanstack/react-router"
import {
  FileText,
  MessageCircle,
  Play,
  Sparkles,
  Users,
} from "lucide-react"
import { useState } from "react"
import {
  Card,
  CardContent,
} from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import SidePanel from "@/components/SidePanel"

type SidePanel = "default" | "notes" | "summary" | "chat"

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/lectures/$lectureId/',
)({
  component: RouteComponent,
})

function RouteComponent() {

  const [panel, setPanel] = useState<SidePanel>("default")

  return (
    <Card className="p-6">
      <div className="p-6 space-y-6">
        {/* Header */}
        <div>
          <h1 className="text-2xl font-semibold">
            Roadmap Planning: From Vision to Prioritisation
          </h1>
          <div className="flex items-center gap-2 text-sm text-muted-foreground mt-1">
            <span>Prof. Anvesh Jain</span>
            <span>•</span>
            <span>13 Jan, 12:00 PM</span>
          </div>

          <div className="flex gap-2 mt-2">
            <Badge variant="secondary">Faculty Led</Badge>
            <Badge variant="secondary">Mandatory</Badge>
            <Badge variant="secondary">Module 1</Badge>
          </div>
        </div>

        {/* Main */}
        <div className="grid grid-cols-1 lg:grid-cols-[1fr_380px] gap-6">
          {/* Video */}
          <Card className="overflow-hidden">
            <CardContent className="p-0">
              <div className="relative aspect-video bg-black flex items-center justify-center">
                <Button
                  size="icon"
                  className="h-16 w-16 rounded-full bg-red-600 hover:bg-red-700"
                >
                  <Play className="h-8 w-8 text-white fill-white" />
                </Button>
              </div>
            </CardContent>
          </Card>

          {/* Side Panel */}
          <SidePanel panel={panel} onClose={() => setPanel("default")} />
        </div>

        {/* Bottom Buttons */}
        <div className="flex flex-wrap gap-3">
          <Button variant="outline" onClick={() => setPanel("notes")}>
            <FileText className="h-4 w-4 mr-2" />
            Notes
          </Button>

          <Button variant="outline" onClick={() => setPanel("summary")}>
            <Sparkles className="h-4 w-4 mr-2" />
            AI Summary
          </Button>

          <Button variant="outline" onClick={() => setPanel("chat")}>
            <MessageCircle className="h-4 w-4 mr-2" />
            AI Chat
          </Button>

          <Button variant="outline">
            <Users className="h-4 w-4 mr-2" />
            Discussions
          </Button>
        </div>
      </div>
    </Card>
  )
}