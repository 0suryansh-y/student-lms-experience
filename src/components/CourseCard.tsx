import { useNavigate } from "@tanstack/react-router"
import type { Course } from "@/types"
import { Card, CardContent, CardFooter, CardHeader } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Progress } from "@/components/ui/progress"
import { encoder } from "@/utils/encoder"

export default function CourseCard({ course }: { course: Course }) {

    const navigate = useNavigate()

    const handleClick = async () => {
        const hash = await encoder(course.id)
        const courseId = hash.slice(0, 4)

        navigate({
            to: "/courses/$courseId",
            params: { courseId: courseId },
        })
    }



    return (
        <Card className="rounded-lg">
            <CardHeader className="flex flex-row gap-4">
                <img
                    src={course.image}
                    alt={course.org}
                    className="h-12 w-12 rounded-lg object-contain border"
                />
                <div className="space-y-1">
                    <h3 className="text-lg font-semibold leading-snug">
                        {course.title}
                    </h3>
                    <p className="text-sm text-muted-foreground">By {course.org}</p>
                </div>
            </CardHeader>

            <CardContent className="space-y-2">
                <Progress value={course.progress} />
                <div className="flex items-center justify-between text-sm text-muted-foreground">
                    <span>Course Progress</span>
                    <span>{course.progress}%</span>
                </div>
            </CardContent>

            <CardFooter className="flex gap-4">
                <Button className="rounded-lg" onClick={handleClick}>
                    {course.cta === "resume" ? "Resume Learning" : "Start Learning"}
                </Button>
                <Button variant="link" className="px-0">
                    Course Details
                </Button>
            </CardFooter>
        </Card>
    )
}