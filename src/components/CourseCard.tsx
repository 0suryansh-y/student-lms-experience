import { useNavigate } from "@tanstack/react-router"
import type { CourseType } from "@/server/courses/fetchCourses"
import { Card, CardContent, CardFooter, CardHeader } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Progress } from "@/components/ui/progress"


export default function CourseCard({ course }: { course: CourseType }) {

    const navigate = useNavigate()

    const handleClick = () => {

        navigate({
            to: "/courses/$courseId/lectures",
            params: { courseId: JSON.stringify(course.id) },
            search: {page: undefined}
        })
    }


    return (
        <Card className="rounded-lg">
            <CardHeader className="flex flex-row gap-4">
                <img
                    src={course.meta?.["courseLogo"] ?? "https://i.pravatar.cc/80"}
                    alt={course.meta?.["courseLogo"] ?? "https://i.pravatar.cc/80"}
                    className="h-12 w-12 rounded-lg object-contain border"
                />
                <div className="space-y-1">
                    <h3 className="text-lg font-semibold leading-snug">
                        {course.name}
                    </h3>
                    <p className="text-sm text-muted-foreground">By {course.program}</p>
                </div>
            </CardHeader>

            <CardContent className="space-y-2">
                {/** Replace course.id by actual course progess */}
                <Progress value={course.id} />
                <div className="flex items-center justify-between text-sm text-muted-foreground">
                    <span>Course Progress</span>
                    <span>{course.id}%</span>
                </div>
            </CardContent>

            <CardFooter className="flex gap-4">
                <Button className="rounded-lg" onClick={handleClick}>
                    Start Learning
                </Button>
                <Button variant="link" className="px-0">
                    Course Details
                </Button>
            </CardFooter>
        </Card>
    )
}