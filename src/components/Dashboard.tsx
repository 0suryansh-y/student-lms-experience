import { useEffect, useState } from 'react'
import { Link } from "@tanstack/react-router"
import { ChevronRight, FileText, Megaphone, } from "lucide-react"
import type { ReactNode } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { getWeeklyRange } from "@/utils/generics"




export default function DashboardPage() {

    const [dateRange, setDateRange] = useState<string>("");

    useEffect(() => {
        getWeeklyRange().then((range) => setDateRange(range));
    }, []);


    return (
        <div className="grid h-screen grid-cols-1 gap-6 bg-muted/40 p-6 md:grid-cols-3 mb-3">
            {/* LEFT COLUMN */}
            <div className="md:col-span-2 flex flex-col gap-6">
                {/* Schedule */}
                <Card>
                    <CardHeader className="pb-2">
                        <CardTitle className="text-lg font-bold">Your Schedule</CardTitle>
                        <p className="text-sm text-muted-foreground">{dateRange}</p>
                    </CardHeader>
                    <CardContent className="flex flex-col gap-4 max-h-80 overflow-y-auto">
                        {Array.from({ length: 8 }).map((_, i) => (
                            <ScheduleItem
                                key={i}
                                date="Fri"
                                day="30"
                                title="assessment testing for sticky banner multi day"
                                time="9:50pm - Day-1/4"
                                icon={<FileText className="h-5 w-5 text-primary" />}
                            />
                        ))}

                    </CardContent>
                </Card>


                {/* Pending Tasks */}
                <Card className="flex-1">
                    <CardHeader className="flex flex-row items-center justify-between">
                        <CardTitle className="text-lg">Pending Tasks</CardTitle>
                        <Badge variant="destructive">0</Badge>
                    </CardHeader>
                    <CardContent className="flex h-full items-center justify-center text-sm text-muted-foreground">
                        No pending tasks at the moment
                    </CardContent>
                </Card>
            </div>

            {/* RIGHT COLUMN */}
            <div className="flex flex-col gap-6">
                {/* Product Updates */}
                <Card>
                    <CardHeader>
                        <CardTitle className="text-lg">Product Updates</CardTitle>
                    </CardHeader>
                    <Link to='/whats-new'>
                        <CardContent>
                            <div className="flex items-center justify-between rounded-lg border p-4">
                                <div className="flex items-center gap-3">
                                    <Megaphone className="h-5 w-5 text-primary" />
                                    <p className="text-sm font-medium">
                                        Product Update | Get access to all platforms of Masai at one place!
                                    </p>
                                </div>
                                <ChevronRight className="h-4 w-4 text-muted-foreground" />
                            </div>
                        </CardContent>
                    </Link>
                </Card>

                {/* Announcements */}
                <Card className="flex-1">
                    <CardHeader>
                        <CardTitle className="text-lg">Announcements</CardTitle>
                    </CardHeader>
                    <CardContent className="flex h-full items-center justify-center text-sm text-muted-foreground">
                        No announcements yet
                    </CardContent>
                </Card>
            </div>
        </div>
    )
} interface ScheduleItemProps {
    date: string
    day: string
    title: string
    time: string
    icon: ReactNode
}

function ScheduleItem({
    date,
    day,
    title,
    time,
    icon,
}: ScheduleItemProps) {

    return (
        <div className="flex gap-4 rounded-lg border p-4">
            <div className="flex flex-col items-center justify-center rounded-md bg-primary px-3 py-2 text-primary-foreground">
                <span className="text-xs font-medium">{date}</span>
                <span className="text-sm font-bold">{day}</span>
            </div>

            <div className="flex flex-1 items-start gap-3">
                {icon}
                <div>
                    <p className="text-sm font-medium">{title}</p>
                    <p className="text-xs text-muted-foreground">{time}</p>
                </div>
            </div>
        </div>
    )
}