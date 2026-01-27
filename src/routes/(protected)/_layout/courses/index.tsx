import { createFileRoute } from "@tanstack/react-router"
import { useQuery } from "@tanstack/react-query"
import type { Course } from "@/types"
import CourseCard from "@/components/CourseCard"
import CourseCardSkeleton from "@/components/CourseSkeletonCard"
import { fetchCourses } from "@/server/courses/fetchCourses"


export const Route = createFileRoute('/(protected)/_layout/courses/')({
  beforeLoad: () => {
    return {id: "8"}
  },
  component: CoursesRoute,
})

function CoursesRoute() {

  const { data, isLoading } = useQuery({
    queryKey: ["courses"],
    queryFn: fetchCourses,
  })




  return (
    <section className="bg-[#FAF9F9] min-h-screen py-8">
      <div className="mx-auto max-w-7xl px-4">
        <div className="grid grid-cols-1 gap-6 sm:grid-cols-2">
          {isLoading
            ? Array.from({ length: 6 }).map((_, i) => (
              <CourseCardSkeleton key={i} />
            ))
            : data?.map((course) => (
                <CourseCard key={course.id} course={course} />

            ))}
        </div>
      </div>
    </section>
  )
}
