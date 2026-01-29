import type { ThreadType } from '@/server/discussions/fetchDiscussionThreads'
import { Card, CardContent } from "@/components/ui/card"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"



export default function ViewDiscussionThreads({ thread }: { thread: ThreadType }) {
    return (
            <div className="px-6 py-8 space-y-6">
                <div className="space-y-4">

                    <div className="space-y-4">
                        <Card>
                            <CardContent className="p-5 space-y-2">
                                <div className="flex items-center gap-3">
                                    <Avatar>
                                        <AvatarImage src="https://i.pravatar.cc/80" />
                                        <AvatarFallback>
                                            AB
                                        </AvatarFallback>
                                    </Avatar>

                                    <div>
                                        <p className="font-medium">
                                            {thread.userId}
                                        </p>
                                        <p className="text-xs text-muted-foreground">
                                            {thread.discussionId}
                                        </p>
                                    </div>
                                </div>

                                <p className="text-sm text-muted-foreground pl-11">
                                    {thread.message}
                                </p>
                            </CardContent>
                        </Card>
                    </div>
                </div>
            </div>
    )
}
