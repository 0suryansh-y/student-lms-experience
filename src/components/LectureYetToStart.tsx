import { Badge } from "@/components/ui/badge";

export function LectureYetToStart() {
    return(
        <div className="min-h-screen flex flex-col space-y-6 p-4">
            <div className="mt-6">
                <h1 className="text-2xl font-semibold">
                    Roadmap Planning: Vision to Prioritisation
                </h1>

                <div className="flex items-center gap-2 text-sm text-muted-foreground mt-1">
                    <span>Prof. Anvesh Jain</span>
                    <span>•</span>
                    <span>13 Jan, 12:00 PM - 01:00 PM</span>
                    <Badge variant="secondary" className="bg-white text-[#6C7280]">Faculty Led</Badge>
                    <Badge variant="secondary" className="bg-white text-[#6C7280]">Mandatory</Badge>
                    <Badge variant="secondary" className="bg-white text-[#6C7280]">Module 1</Badge>
                </div>
            </div>
            <div className="flex items-center justify-between border bg-white p-4 rounded-xl">
                <div className="flex items-center gap-4">
                    <img src="/LockIcon.svg" alt="zoom-icon" />
                    <div>
                        <p>Lecture hasn't started yet.</p>
                        <p className="text-[#6C7280]">This lecture will unlock 10 minutes before the scheduled time at 1:50 PM</p>
                    </div>
                </div>
            </div>
            <div className="flex flex-1 items-center justify-center border bg-white p-4 rounded-xl">
                <div className="flex flex-col items-center justify-center gap-4">
                    <img src="/NothingYetPlaceholder.svg" alt="" className="h-32" />
                    <p className="text-xl font-medium">Nothing Here Yet</p>
                    <p className="max-w-[30ch] text-center text-[#6C7280]">
                        Notes, Summary, AI Tutor and Chat will be available after the lecture
                    </p>

                </div>
            </div>
        </div>
    )
}
