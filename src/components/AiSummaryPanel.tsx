import { ScrollArea } from "@/components/ui/scroll-area"

export default function AiSummaryPanel() {
  return (
    <ScrollArea className="h-full pr-2">
      <div className="space-y-4 text-sm">
        <h4 className="font-semibold">Overview</h4>
        <p>
          This lecture focuses on roadmap planning, balancing long-term vision
          with short-term execution.
        </p>
      </div>
    </ScrollArea>
  )
}
