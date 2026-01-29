// components/shared/resourceCard.tsx
import { FileText } from 'lucide-react'
import { useNavigate } from '@tanstack/react-router'
import { TagChip } from './TagChip'
import type { ResourceType } from '@/server/resources/fetchAllResources'
import { Card } from '@/components/ui/card'


export function ResourceCard({ resource }: { resource: ResourceType }) {

  const navigate = useNavigate()
  
      const handleClick = () => {
  
          navigate({
              to: "/courses/$courseId/resources/$resourceId",
              params: { courseId: JSON.stringify(resource.batchId), resourceId: JSON.stringify(resource.id)},
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
                {resource.title}
              </h3>

              <p className="text-sm text-muted-foreground">
                {resource.type} • {resource.zoomLink}
              </p>

              <div className="flex gap-2 pt-2">
                <TagChip label="Coding" />
                <TagChip label={resource.category} variant="highlight" />
                <TagChip label="Mandatory" />
              </div>
            </div>
          </div>

        </div>
      </Card>
    </div>
  )
}
