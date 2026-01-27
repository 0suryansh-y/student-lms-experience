import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Button } from "@/components/ui/button"
import { Separator } from "@/components/ui/separator"
import { Textarea } from "@/components/ui/textarea"

const responses = [
    {
        name: "Rajat Kumar",
        avatar: "https://i.pravatar.cc/80",
        message: "i have the same doubt",
        time: "24 Jun, 2024 at 8:15 PM (IST)",
    },
    {
        name: "Girija Bamboriya",
        avatar: "https://i.pravatar.cc/80",
        message: "how resubmit a file or add a file",
        time: "24 Jun, 2024 at 9:00 PM (IST)",
    },
    {
        name: "Sonmathi Lakshya R J",
        avatar: "https://i.pravatar.cc/80",
        message:
            "i guess we can add only 1 file and not edit it later....but dont worry sir told assignment are only for practice and till now marks are not awarded (maybe later)",
        time: "24 Jun, 2024 at 9:17 PM (IST)",
    },
    {
        name: "Siddharth Khanna",
        avatar: "https://i.pravatar.cc/80",
        message: "i have same doubt",
        time: "24 Jun, 2024 at 9:19 PM (IST)",
    },
]

export default function DiscussionView() {
    return (
        <Card className="p-6">
            <div className="px-6 py-8 space-y-6">
                {/* Header */}
                <div className="flex items-start justify-between gap-4">
                    <div className="space-y-2">
                        <h1 className="text-2xl font-semibold">
                            Doubt on file submission
                        </h1>

                        <div className="flex flex-wrap gap-2">
                            <Badge variant="outline">PUBLIC</Badge>
                            <Badge variant="secondary">CLOSED</Badge>
                        </div>
                    </div>

                    <Button variant="outline">
                        REOPEN DISCUSSION
                    </Button>
                </div>



                {/* Question */}

                <Card>
                    <CardContent className="p-6 space-y-4 text-sm leading-relaxed">
                        {/* Author */}
                        <div className="flex items-center gap-3 text-sm text-muted-foreground">
                            <Avatar className="h-8 w-8">
                                <AvatarImage src="https://i.pravatar.cc/80" />
                                <AvatarFallback>SL</AvatarFallback>
                            </Avatar>

                            <span className="font-medium text-foreground">
                                Sonmathi Lakshya R J
                            </span>
                            <span>•</span>
                            <span>24 Jun, 2024 at 2:07 PM (IST)</span>
                        </div>
                        <p>
                            which file should i submit here, the code of hello
                            world, or the code to print name?
                        </p>

                        <p>or a screenshot is enough?</p>
                    </CardContent>
                </Card>

                <Separator />

                {/* Reply Box */}
<Card>
  <CardContent className="p-5 space-y-4">
    <div className="flex items-start gap-3">
      <Avatar className="h-8 w-8">
        <AvatarImage src="https://i.pravatar.cc/80" />
        <AvatarFallback>U</AvatarFallback>
      </Avatar>

      <div className="flex-1 space-y-3">
        <Textarea
          placeholder="Write your reply..."
          className="min-h-[90px]"
        />

        <div className="flex justify-end">
          <Button>
            Post Reply
          </Button>
        </div>
      </div>
    </div>
  </CardContent>
</Card>

<Separator />


                {/* Responses */}
                <div className="space-y-4">
                    <h2 className="text-lg font-semibold">Responses</h2>

                    <div className="space-y-4">
                        {responses.map((res, index) => (
                            <Card key={index}>
                                <CardContent className="p-5 space-y-2">
                                    <div className="flex items-center gap-3">
                                        <Avatar>
                                            <AvatarImage src={res.avatar} />
                                            <AvatarFallback>
                                                {res.name
                                                    .split(" ")
                                                    .map((n) => n[0])
                                                    .join("")}
                                            </AvatarFallback>
                                        </Avatar>

                                        <div>
                                            <p className="font-medium">
                                                {res.name}
                                            </p>
                                            <p className="text-xs text-muted-foreground">
                                                {res.time}
                                            </p>
                                        </div>
                                    </div>

                                    <p className="text-sm text-muted-foreground pl-11">
                                        {res.message}
                                    </p>
                                </CardContent>
                            </Card>
                        ))}
                    </div>
                </div>
            </div>
        </Card>
    )
}
