import { X } from "lucide-react"
import AiChatPanel from "./AiChatPanel"
import AiSummaryPanel from "./AiSummaryPanel"
import NotesPanel from "./NotesPanel"
import AiTutorPanel from "./AiTutorPanel"
import { Card, CardContent, CardHeader } from "@/components/ui/card"
import { Button } from "@/components/ui/button"

type SidePanel = "default" | "notes" | "summary" | "chat"


export default function SidePanel({
  panel,
  onClose,
}: {
  panel: SidePanel
  onClose: () => void
}) {
  const titleMap: Record<SidePanel, string> = {
    default: "",
    notes: "Notes",
    summary: "AI Summary",
    chat: "AI Chat",
  }

  return (
    <Card className="h-full flex flex-col">
      {panel !== "default" && (
        <CardHeader className="flex flex-row items-center justify-between border-b">
          <h3 className="font-medium">{titleMap[panel]}</h3>
          <Button size="icon" variant="ghost" onClick={onClose}>
            <X className="h-4 w-4" />
          </Button>
        </CardHeader>
      )}

      <CardContent className="flex-1 p-4">
        {panel === "default" && <AiTutorPanel />}
        {panel === "notes" && <NotesPanel />}
        {panel === "summary" && <AiSummaryPanel />}
        {panel === "chat" && <AiChatPanel />}
      </CardContent>
    </Card>
  )
}
