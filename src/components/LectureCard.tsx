// components/shared/LectureCard.tsx
import { FileText } from 'lucide-react'
import { useNavigate } from '@tanstack/react-router'
import { TagChip } from './TagChip'
import type { LectureType } from '@/server/lectures/fetchAllLectures'
import { Card } from '@/components/ui/card'



export function LectureCard({ lecture }: { lecture: LectureType }) {

    
  // const StatusIcon = StatusConfig[completionStatus].icon

  const navigate = useNavigate()
  
      const handleClick = () => {
  
          navigate({
              to: "/courses/$courseId/lectures/$lectureId",
              params: { courseId: JSON.stringify(lecture.batchId), lectureId: JSON.stringify(lecture.id)},
          })
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
                {lecture.title}
              </h3>

              <p className="text-sm text-muted-foreground">
                {lecture.type} • {lecture.zoomLink}
              </p>

              <div className="flex gap-2 pt-2">
                <TagChip label={lecture.type} />
                <TagChip label={lecture.category} variant="highlight" />
                <TagChip label="Mandatory" />
              </div>
            </div>
          </div>

          {/* Status */}

          {/* <StatusIcon
            className={`h-6 w-6 ${StatusConfig[completionStatus].className}`}
          /> */}
        </div>
      </Card>
    </div>
  )
}
