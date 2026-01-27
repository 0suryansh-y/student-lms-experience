import { ChevronDown, ThumbsDown, ThumbsUp } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"

export default function AiTutorPanel() {
  return (
    <div className="space-y-6">
      <div className="text-center space-y-2">
        <img
          src="https://i.pravatar.cc/80"
          className="mx-auto rounded-full"
        />
        <h3 className="font-semibold">Hello, I’m your AI Tutor</h3>
        <p className="text-sm text-muted-foreground">
          Select a language to start a conversation
        </p>

        <Button variant="outline" className="w-full justify-between">
          Select Language
          <ChevronDown className="h-4 w-4" />
        </Button>
      </div>

      <Card>
        <div className="p-3 flex items-center justify-between">
          <span className="text-sm">
            Associated Lectures & Assignments
          </span>
          <Badge variant="destructive">3</Badge>
        </div>
      </Card>


      <Card>
        <div className="p-3 flex items-center justify-between">
          <span className="text-sm">Was this lecture helpful?</span>
          <div className="flex gap-2">
            <ThumbsUp className="h-4 w-4 cursor-pointer" />
            <ThumbsDown className="h-4 w-4 cursor-pointer" />
          </div>
        </div>
      </Card>

    </div>
  )
}
