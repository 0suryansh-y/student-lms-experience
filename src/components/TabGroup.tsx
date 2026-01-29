import { Link, getRouteApi, useMatchRoute } from "@tanstack/react-router"
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs"

export default function TabGroup() {
  const { useParams } = getRouteApi("/(protected)/_layout/courses/$courseId/_courseTabLayout")
  const { courseId } = useParams()

  const matchRoute = useMatchRoute()

  // Decide active tab from URL
  const activeTab =
  matchRoute({
    to: "/courses/$courseId/lectures",
    params: { courseId },
    fuzzy: true,
  })
    ? "lectures"
    : matchRoute({
        to: "/courses/$courseId/assignments",
        params: { courseId },
        fuzzy: true,
      })
    ? "assignments"
    : matchRoute({
        to: "/courses/$courseId/resources",
        params: { courseId },
        fuzzy: true,
      })
    ? "resources"
    : matchRoute({
        to: "/courses/$courseId/announcements",
        params: { courseId },
        fuzzy: true,
      })
    ? "announcements"
    : matchRoute({
        to: "/courses/$courseId/discussions",
        params: { courseId },
        fuzzy: true,
      })
    ? "discussions"
    : "overview"


  return (
    <Tabs value={activeTab} className="w-fit">
      <TabsList>

        <TabsTrigger value="lectures" asChild>
          <Link
            to="/courses/$courseId/lectures"
            params={{ courseId }}
            search={{ page: undefined }}
          >
            Lectures
          </Link>
        </TabsTrigger>

        <TabsTrigger value="assignments" asChild>
          <Link
            to="/courses/$courseId/assignments"
            params={{ courseId }}
            search={{ page: undefined }}
          >
            Assignments
          </Link>
        </TabsTrigger>

        <TabsTrigger value="resources" asChild>
          <Link
            to="/courses/$courseId/resources"
            params={{ courseId }}
            search={{ page: undefined }}
          >
            Resources
          </Link>
        </TabsTrigger>

        <TabsTrigger value="announcements" asChild>
          <Link
            to="/courses/$courseId/announcements"
            params={{ courseId }}
            search={{ page: undefined }}
          >
            Announcements
          </Link>
        </TabsTrigger>

        <TabsTrigger value="discussions" asChild>
          <Link
            to="/courses/$courseId/discussions"
            params={{ courseId }}
            search={{ page: undefined }}
          >
            Discussions
          </Link>
        </TabsTrigger>
      </TabsList>
    </Tabs>
  )
}
