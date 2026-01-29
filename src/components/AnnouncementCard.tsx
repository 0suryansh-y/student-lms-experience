// components/shared/announcementCard.tsx
import { FileText } from 'lucide-react'
import { useNavigate } from '@tanstack/react-router'
import { TagChip } from './TagChip'
import type { AnnouncementsType } from '@/server/announcements/fetchAllAnnouncement'
import { Card } from '@/components/ui/card'

export function AnnouncementCard({ announcement }: { announcement: AnnouncementsType }) {


  const navigate = useNavigate()
  
      const handleClick = () => {
  
          navigate({
              to: "/courses/$courseId/announcements/$announcementId",
              params: { courseId: JSON.stringify(announcement.batchId), announcementId: JSON.stringify(announcement.id)},
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
                {announcement.subject}
              </h3>

              <p className="text-sm text-muted-foreground">
                {announcement.body}
              </p>

              <div className="flex gap-2 pt-2">
                <TagChip label={announcement.type}/>
                <TagChip label={announcement.category} variant="highlight" />
                <TagChip label={announcement.schedule ?? ""} />
              </div>
            </div>
          </div>
        </div>
      </Card>
    </div>
  )
}
