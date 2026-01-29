import { Outlet, createFileRoute } from '@tanstack/react-router'
// import BreadCrumb from '@/components/BreadCrumb'
import TabGroup from '@/components/TabGroup'


export const Route = createFileRoute(
  '/(protected)/_layout/courses/$courseId/_courseTabLayout'
)({
  component: CourseLayout,
})
function CourseLayout() {


  return (
    <div className="space-y-6 px-6 py-8">
      {/* <div className="mb-4">
        <BreadCrumb />
      </div> */}

      <h2 className="text-2xl font-semibold">Product Management with Generative & Agentic AI</h2>
      <TabGroup />

      <div className="grid gap-6">
        <Outlet />
      </div>
    </div>
  )
}