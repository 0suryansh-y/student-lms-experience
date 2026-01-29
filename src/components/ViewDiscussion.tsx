import type { DiscussionType } from '@/server/discussions/fetchAllDiscussions'
import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Button } from "@/components/ui/button"
import { Separator } from "@/components/ui/separator"
import { Textarea } from "@/components/ui/textarea"


export default function DiscussionView({ discussion }: { discussion: DiscussionType }) {
    return (
        <Card className="p-6">
            <div className="px-6 py-8 space-y-6">
                {/* Header */}
                <div className="flex items-start justify-between gap-4">
                    <div className="space-y-2">
                        <h1 className="text-2xl font-semibold">
                            {discussion.title}
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
                                Sonmathi Lakshya R J {discussion.userId}
                            </span>
                            <span>•</span>
                            <span>24 Jun, 2024 at 2:07 PM (IST)</span>
                        </div>
                        <p>
                            {discussion.message}
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
            </div>
        </Card>
    )
}
