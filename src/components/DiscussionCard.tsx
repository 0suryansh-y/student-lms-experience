import { FileText } from 'lucide-react'
import { useNavigate } from '@tanstack/react-router'
import { TagChip } from './TagChip'
import { Card } from '@/components/ui/card'
import { encoder } from '@/utils/encoder'



// interface DiscussionCardProps {
//   title: string
//   author: string
//   dateRange: string
//   completionStatus: CardStatus
//   params: {
//     courseId: string
//     discussionId: string
//   }
// }

interface DiscussionCardProps {
  id: number
  title: string
  message: string
  data: Record<string, any> | null
  status: string | null

  entityType: string
  entityId: number
  userId: number

  isClosed: number
  public: number

  createdAt: string | null
  updatedAt: string | null
  deletedAt: string | null

  assigneeId: number | null
  gptCentralData: Record<string, any> | null
}


export function DiscussionCard({
  id,
  title,
  message,
  entityType,
  // entityId,
  // userId,
  // isClosed,
  updatedAt
}: DiscussionCardProps) {

    
  // const StatusIcon = StatusConfig[completionStatus].icon

  const navigate = useNavigate()
  
      const handleClick = async () => {
          const hash = await encoder(JSON.stringify(id))
          const discussionId = hash.slice(0,6)
  
          navigate({
              to: "/courses/$courseId/discussions/$discussionId",
              params: { courseId: JSON.stringify(id), discussionId: discussionId},
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
                {message} • {updatedAt}
              </p>

              <div className="flex gap-2 pt-2">
                <TagChip label={entityType} />
                <TagChip label="Evaluation" variant="highlight" />
                <TagChip label="Mandatory" />
              </div>
            </div>
          </div>

        </div>
      </Card>
    </div>
  )
}
