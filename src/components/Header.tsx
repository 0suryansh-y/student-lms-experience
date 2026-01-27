import { CalendarDays, MessageSquareMore } from "lucide-react"
import { Link } from "@tanstack/react-router"
import { DropdownMenuProfile } from "@/components/DropdownMenuProfile"

const IMAGES = {
  MASAI_LOGO:
    "https://students.masaischool.com/static/media/masai-logo.e5c8801d4f26d2da036ec9e4b93cb202.svg",
} as const

type NavItem = {
  name: string
  url: Parameters<typeof Link>[0]["to"]
}

const navMenu: ReadonlyArray<NavItem> = [
  { name: "Home", url: "/" },
  { name: "Learn", url: "/courses" },
  { name: "Lectures", url: "/lectures" },
  { name: "Announcements", url: "/announcements" },
  { name: "Assignments", url: "/assignments" },
  { name: "Resources", url: "/resources" },
  { name: "Support", url: "/support" }

] as const

export default function Header() {
  return (
    <header className="p-4 flex items-center shadow-lg">
      <Link to="/" className="ml-4">
        <img src={IMAGES.MASAI_LOGO} alt="Masai Logo" className="h-10" />
      </Link>
      <div className="flex items-center justify-between w-full px-8">
        <nav>
          <ul className="flex gap-6">
            {navMenu.map((item) => (
              <li key={item.name}>
                <Link to={item.url}>{item.name}</Link>
              </li>
            ))}
          </ul>
        </nav>

        <div className="flex items-center gap-4">
          <CalendarDays />
          <MessageSquareMore />
          <DropdownMenuProfile />
        </div>

      </div>

    </header>
  )
}
