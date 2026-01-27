import { fetchCourseById } from "@/server/courses/fetchCourseById"


// queries/course.ts
export const courseQueryById = (courseId: string) => ({
  queryKey: ['course', courseId],
  queryFn: () => fetchCourseById(courseId),
})
