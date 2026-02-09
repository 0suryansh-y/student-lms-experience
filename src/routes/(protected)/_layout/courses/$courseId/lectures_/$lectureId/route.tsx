import { createFileRoute, getRouteApi } from "@tanstack/react-router"
import { useState } from "react"
import { fetchLecturesById } from "@/server/lectures/fetchLecturesById"
import { LectureWithJoinCTA } from "@/components/LectureWithJoinCTA"
import { LectureYetToStart } from "@/components/LectureYetToStart"
import { LectureWithVideo } from "@/components/LectureWithVideo"
import { LectureWithNoVideo } from "@/components/LectureWithNoVideo"
import { getCurrentTime } from "@/utils/generics"

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
    const { iso } = await getCurrentTime()

    return { iso, lectureData }
  }

})

function RouteComponent() {

  const DEFAULT_VIDEO_SRC = "https://stream.mux.com/VZtzUzGRv02OhRnZCxcNg49OilvolTqdnFLEqBsTwaxU/high.mp4"

  const [panel, setPanel] = useState<SidePanel>("default")

  const { useParams } = getRouteApi('/(protected)/_layout/courses/$courseId/lectures_/$lectureId')

  const { courseId, lectureId } = useParams()

  const data = Route.useLoaderData();

  const { lectureData, iso } = data;

  if (!lectureData[0]?.schedule || !lectureData[0]?.concludes) {
    return <LectureYetToStart />
  }

  const now = new Date(iso).getTime()
  const start = new Date(lectureData[0].schedule).getTime()
  const end = new Date(lectureData[0].concludes).getTime()

  const fiveMinutes = 5 * 60 * 1000

  // 🔒 More than 5 mins before start
  if (now < start - fiveMinutes) {
    return <LectureYetToStart />
  }

  // 🎥 Within 5 mins before start until conclude
  if (now >= start - fiveMinutes && now <= end) {
    return <LectureWithJoinCTA />
  }

  // 📺 After conclude
  if (now > end) {
    if (lectureData[0].videos?.[0]) {
      console.log(lectureData[0].videos[0])
      return (
        <LectureWithVideo
          lectureTitle={lectureData[0].title}
          panel={panel}
          setPanel={setPanel}
          courseId={courseId}
          lectureId={lectureId}
          videoSrc={lectureData[0].videos[0]}
        />
      )
    }

    return (
      <LectureWithNoVideo
        lectureTitle={lectureData[0].title}
        panel={panel}
        setPanel={setPanel}
        courseId={courseId}
        lectureId={lectureId}
      />
    )
  }

  return null
}
