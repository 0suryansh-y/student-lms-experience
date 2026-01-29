import { BadgeCheck, ChevronRight, FileText, Play, RotateCcw, } from "lucide-react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"

export default function Dashboard() {

    const schedule = [
        {
            day: "Wed",
            date: "08",
            items: [
                {
                    type: "video",
                    title: "Enhanced Interactive Programming",
                    time: "10AM - 11AM",
                    meta: "IIM-M DM",
                },
                {
                    type: "doc",
                    title: "Programming",
                    time: "11AM - 2PM",
                    meta: "BITSOM PMAI",
                },
            ],
        },
        {
            day: "Tue",
            date: "09",
            items: [
                {
                    type: "video",
                    title: "Enhanced Interactive Programming",
                    time: "10AM - 11AM",
                    meta: "IIM-M DM",
                },
                {
                    type: "doc",
                    title: "Programming",
                    time: "11AM - 2PM",
                    meta: "BITSOM PMAI",
                },
            ],
        },
        {
            day: "Sun",
            date: "12",
            items: [
                {
                    type: "video",
                    title: "Enhanced Interactive Programming",
                    time: "10AM - 11AM",
                    meta: "IIM-M DM",
                },
                {
                    type: "doc",
                    title: "Programming",
                    time: "11AM - 2PM",
                    meta: "BITSOM PMAI",
                },
            ],
        },
    ]


    return (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            {/* Left Column */}
            <div className="lg:col-span-2 space-y-6">
                {/* Schedule */}
                <Card className="p-4">
                    <h2 className="text-2xl font-semibold">Lectures</h2>

                    <div className="space-y-8">
                        {schedule.map((dayBlock, i) => (
                            <div key={i} className="flex gap-4">
                                {/* Date */}
                                <div className="flex flex-col items-center w-14">
                                    <div className="rounded-lg bg-primary text-primary-foreground px-3 py-1 text-sm font-semibold">
                                        {dayBlock.day}
                                    </div>
                                    <div className="text-sm text-muted-foreground mt-1">
                                        {dayBlock.date}
                                    </div>
                                </div>


                                {/* Events */}
                                <div className="flex-1 space-y-4">
                                    {dayBlock.items.map((item, idx) => (
                                        <Card key={idx} className="p-4 flex items-start gap-4 rounded-2xl">
                                            <div className="mt-1">
                                                {item.type === "video" ? (
                                                    <div className="h-9 w-9 rounded-full border flex items-center justify-center text-primary">
                                                        <Play className="h-4 w-4" />
                                                    </div>
                                                ) : (
                                                    <div className="h-9 w-9 rounded-lg bg-cyan-100 text-cyan-600 flex items-center justify-center">
                                                        <FileText className="h-4 w-4" />
                                                    </div>
                                                )}
                                            </div>


                                            <div className="flex-1">
                                                <p className="font-semibold truncate">{item.title}</p>
                                                <p className="text-sm text-muted-foreground">
                                                    {item.time} &nbsp; • &nbsp; {item.meta}
                                                </p>
                                            </div>
                                        </Card>
                                    ))}
                                </div>
                            </div>
                        ))}
                    </div>

                </Card>


                {/* No pending tasks */}
                <Card className="flex flex-col items-center justify-center py-16">
                    <RotateCcw className="h-10 w-10 text-muted-foreground mb-4" />
                    <p className="font-medium">No pending tasks</p>
                    <p className="text-sm text-muted-foreground">You’re all caught up. Any pending tasks will appear here.</p>
                </Card>
            </div>

            {/* Right Column */}
            <div className="space-y-6">
                {/* Announcements */}
                <Card>
                    <CardHeader>
                        <CardTitle>Announcements</CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-3">
                        {["Testin 3", "Testin 2", "Testin g"].map((a, i) => (
                            <div key={i} className="rounded-lg border px-4 py-3 text-sm font-medium">
                                {a}
                            </div>
                        ))}
                    </CardContent>
                </Card>

                {/* Product Updates */}
                <Card>
                    <CardHeader>
                        <CardTitle>Product Updates</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="flex items-center gap-3 rounded-xl border p-4 cursor-pointer hover:bg-muted">
                            <BadgeCheck className="h-5 w-5 text-primary" />
                            <p className="text-sm font-medium flex-1">
                                Product Update | Get access to all platforms of Masai at one place!
                            </p>
                            <ChevronRight className="h-4 w-4 text-muted-foreground" />
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    )
}
