import { createFileRoute, redirect } from '@tanstack/react-router'

export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/_courseTabLayout/'
)({
  validateSearch: (search) => {
    const page =
      typeof search.page === 'number'
        ? search.page
        : Number(search.page)

    return {
      page: page && page > 0 ? page : undefined,
    }
  },

  loader: ({ params }) => {
    throw redirect({
      to: '/courses/$courseId/lectures',
      params: { courseId: params.courseId },
      search: { page: undefined },
      replace: true,
    })
  },

  component: CourseHome,
})

function CourseHome() {
  return null
}
