import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/'
)({
  component: CourseHome,
})

function CourseHome() {
  return (
    <div className="rounded-lg border p-6">
      <h2 className="text-xl font-semibold mb-2">
        Course Overview
      </h2>
      <p className="text-muted-foreground">
        Have some stats and current progress/pending/upcoming work of user here
      </p>
    </div>
  )
}
