import { ScrollArea } from "@/components/ui/scroll-area"

export default function NotesPanel() {
  return (
    <ScrollArea className="h-full pr-2">
      <div className="space-y-4 text-sm">
        <h4 className="font-semibold">Understanding Netflix's Growth Strategy</h4>
        <p>
          Netflix focused on original content to differentiate itself and
          retain long-term subscribers.
        </p>
        <ul className="list-disc pl-4">
          <li>Heavy investment in original content</li>
          <li>Expansion into global markets</li>
          <li>Data-driven content decisions</li>
        </ul>
      </div>
    </ScrollArea>
  )
}
