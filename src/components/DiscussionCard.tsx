import { FileText } from 'lucide-react'
import { getRouteApi, useNavigate } from '@tanstack/react-router'
import { TagChip } from './TagChip'
import type { DiscussionType } from '@/server/discussions/fetchAllDiscussions'
import { Card } from '@/components/ui/card'

type DiscussionRoute = '/(protected)/_layout/courses/$courseId/lectures_/$lectureId' | '/(protected)/_layout/courses/$courseId/assignments_/$assignmentId'

export function DiscussionCard({ discussion }: { discussion: DiscussionType }) {

  const navigate = useNavigate()

  let URL: DiscussionRoute

  if (discussion.entityType.includes('Lecture')) {
      console.log("Lecture", discussion.entityType)
    URL = '/(protected)/_layout/courses/$courseId/lectures_/$lectureId'
  } else if (discussion.entityType.includes('Assignment')) {
    URL = '/(protected)/_layout/courses/$courseId/assignments_/$assignmentId'
  } else {
    throw new Error('Unknown discussion entity type')
  }

  const { useParams } = getRouteApi(URL)
  const { courseId } = useParams()


  const handleClick = () => {



    if (URL.includes('lecture')) {
      console.log("Lecture")
      navigate({
        to: "/courses/$courseId/lectures/$lectureId/discussions/$discussionId",
        params: { courseId: courseId, lectureId: JSON.stringify(discussion.entityId), discussionId: JSON.stringify(discussion.id) },
        search: { page: undefined }
      })
    } else if (URL.includes('assignment')) {
      console.log("Assignment")

      navigate({
        to: "/courses/$courseId/assignments/$assignmentId/discussions/$discussionId",
        params: { courseId: courseId, assignmentId: JSON.stringify(discussion.entityId), discussionId: JSON.stringify(discussion.id) },
        search: { page: undefined }
      })

    }

  }


  return (
    <div onClick={handleClick} className="block">
      <Card className="p-4 hover:shadow-md transition-shadow">
        <div className="flex items-start justify-between gap-4">
          {/* Left content */}
          <div className="flex gap-4">
            <div className="mt-1 text-primary">
              <FileText className="h-6 w-6" />
            </div>

            <div className="space-y-1">
              <h3 className="font-semibold leading-tight">
                {discussion.title}
              </h3>

              <p className="text-sm text-muted-foreground">
                {discussion.message}
              </p>

              <div className="flex gap-2 pt-2">
                <TagChip label={JSON.stringify(discussion.entityId)} />
                <TagChip label={discussion.entityType} variant="highlight" />
                <TagChip label="Mandatory" />
              </div>
            </div>
          </div>

        </div>
      </Card>
    </div>
  )
}
