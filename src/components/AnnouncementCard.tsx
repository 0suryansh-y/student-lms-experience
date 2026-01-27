// components/shared/announcementCard.tsx
import { AlertTriangle, CheckCircle, Clock, FileText } from 'lucide-react'
import { useNavigate } from '@tanstack/react-router'
import { TagChip } from './TagChip'
import type { CardStatus } from '@/types'
import { Card } from '@/components/ui/card'
import { encoder } from '@/utils/encoder'



interface announcementCardProps {
  title: string
  author: string
  dateRange: string
  completionStatus: CardStatus
  params: {
    courseId: string
    announcementId: string
  }
}

const StatusConfig = {
  completed: {
    icon: CheckCircle,
    className: 'text-green-500',
  },
  'in-progress': {
    icon: Clock,
    className: 'text-orange-500',
  },
  warning: {
    icon: AlertTriangle,
    className: 'text-red-500',
  },
}


export function AnnouncementCard({
    title,
  author,
  dateRange,
  completionStatus,
  params,
}: announcementCardProps) {

    
  const StatusIcon = StatusConfig[completionStatus].icon

  const navigate = useNavigate()
  
      const handleClick = async () => {
          const hash = await encoder(params.announcementId)
          const announcementId = hash.slice(-6)
  
          navigate({
              to: "/courses/$courseId/announcements/$announcementId",
              params: { courseId: params.courseId, announcementId: announcementId},
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
                {title}
              </h3>

              <p className="text-sm text-muted-foreground">
                {author} • {dateRange}
              </p>

              <div className="flex gap-2 pt-2">
                <TagChip label="Coding" />
                <TagChip label="Evaluation" variant="highlight" />
                <TagChip label="Mandatory" />
              </div>
            </div>
          </div>

          {/* Status */}
          <StatusIcon
            className={`h-6 w-6 ${StatusConfig[completionStatus].className}`}
          />
        </div>
      </Card>
    </div>
  )
}
