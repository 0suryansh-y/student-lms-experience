import { Link, Outlet } from "@tanstack/react-router"
import {
  FileText,
  MessageCircle,
  Sparkles,
  Users,
} from "lucide-react"

import {
  VideoPlayer,
  VideoPlayerControlBar,
  VideoPlayerMuteButton,
  VideoPlayerPlayButton,
  VideoPlayerTimeDisplay,
  VideoPlayerTimeRange,
  VideoPlayerVolumeRange,
} from "@/components/ui/video-player"

import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import SidePanel from "@/components/SidePanel"

type SidePanelType = "default" | "notes" | "summary" | "chat"

type Props = {
  lectureTitle: string
  panel: SidePanelType
  setPanel: (panel: SidePanelType) => void
  courseId: string
  lectureId: string
  videoSrc: string
}

export function LectureWithVideo({
  lectureTitle,
  panel,
  setPanel,
  courseId,
  lectureId,
  videoSrc,
}: Props) {
  return (
    <div className="p-6 space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-2xl font-semibold">{lectureTitle}</h1>

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
        <VideoPlayer className="rounded-lg overflow-hidden border">
          <video
            slot="media"
            src={videoSrc}
            poster="https://image.mux.com/VZtzUzGRv02OhRnZCxcNg49OilvolTqdnFLEqBsTwaxU/thumbnail.webp?time=0"
            suppressHydrationWarning
          />
          <VideoPlayerControlBar>
            <VideoPlayerPlayButton />
            <VideoPlayerTimeRange />
            <VideoPlayerTimeDisplay showDuration />
            <VideoPlayerMuteButton />
            <VideoPlayerVolumeRange />
          </VideoPlayerControlBar>
        </VideoPlayer>

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

        <Link
          to="/courses/$courseId/lectures/$lectureId/discussions"
          params={{ courseId, lectureId }}
          search={{ page: undefined }}
        >
          <Button variant="outline">
            <Users className="h-4 w-4 mr-2" />
            Discussions
          </Button>
        </Link>
      </div>

      <Outlet />
    </div>
  )
}
