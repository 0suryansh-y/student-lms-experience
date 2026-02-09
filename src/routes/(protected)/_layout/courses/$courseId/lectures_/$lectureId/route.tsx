import { createFileRoute, getRouteApi } from "@tanstack/react-router"
import { useState } from "react"
import { fetchLecturesById } from "@/server/lectures/fetchLecturesById"
import { LectureWithJoinCTA } from "@/components/LectureWithJoinCTA"
import { LectureYetToStart } from "@/components/LectureYetToStart"
import { LectureWithVideo } from "@/components/LectureWithVideo"
import { LectureWithNoVideo } from "@/components/LectureWithNoVideo"

type SidePanel = "default" | "notes" | "summary" | "chat"

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/lectures_/$lectureId',
)({
  component: RouteComponent,
  loader: async ({ params }) => {
    const lectureId = Number(params.lectureId)

    const lectureData = await fetchLecturesById({
      data: { lectureId },
    })
    return { lectureData }
  }

})

function RouteComponent() {

  const DEFAULT_VIDEO_SRC = "https://stream.mux.com/VZtzUzGRv02OhRnZCxcNg49OilvolTqdnFLEqBsTwaxU/high.mp4"

  const [panel, setPanel] = useState<SidePanel>("default")

  const { useParams } = getRouteApi('/(protected)/_layout/courses/$courseId/lectures_/$lectureId')

  const { courseId, lectureId } = useParams()

  const data = Route.useLoaderData();

  const { lectureData } = data;

  const screenType = Math.floor(Math.random() * 4) + 1

  if (screenType === 1) {
    return (
      <LectureWithJoinCTA />
    )
  } else if (screenType === 2) {
    return (
      <LectureYetToStart />
    )
  }else if (screenType === 3) {
    return (
      <LectureWithNoVideo 
        lectureTitle={lectureData[0].title}
        panel={panel}
        setPanel={setPanel}
        courseId={courseId}
        lectureId={lectureId}
        videoSrc={DEFAULT_VIDEO_SRC}
      />
    )
  } else {
    return (
      <LectureWithVideo
        lectureTitle={lectureData[0].title}
        panel={panel}
        setPanel={setPanel}
        courseId={courseId}
        lectureId={lectureId}
        videoSrc={DEFAULT_VIDEO_SRC}
      />
    )
  }

}