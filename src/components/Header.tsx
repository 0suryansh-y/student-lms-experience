import {
  CalendarDays,
  Megaphone,
  Menu,
  MessageSquareMore,
} from "lucide-react"
import { Link } from "@tanstack/react-router"
import { DropdownMenuProfile } from "@/components/DropdownMenuProfile"
import { Button } from "@/components/ui/button"
import {
  Sheet,
  SheetContent,
  SheetTrigger,
} from "@/components/ui/sheet"
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip"


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
  { name: "Assignments", url: "/assignments" },
  { name: "Resources", url: "/resources" },
  { name: "Support", url: "/support" },
] as const

export default function Header() {
  return (
    <header className="sticky top-0 z-50 bg-background border-b">
      <div className="flex items-center justify-between px-4 py-3">
        {/* Logo */}
        <Link to="/" className="flex items-center gap-2">
          <img src={IMAGES.MASAI_LOGO} alt="Masai Logo" className="h-10" />
        </Link>

        {/* Desktop Nav */}
        <nav className="hidden md:flex gap-6">
          {navMenu.map((item) => (
            <Link
              key={item.name}
              to={item.url}
              className="text-sm font-medium text-muted-foreground hover:text-foreground transition"
            >
              {item.name}
            </Link>
          ))}
        </nav>

        {/* Right Actions */}
        <div className="flex items-center gap-3">
          <TooltipProvider>
            <div className="flex items-center gap-1">
              {/* Calendar */}
              <Tooltip>
                <TooltipTrigger asChild>
                  <Button
                    variant="ghost"
                    size="icon"
                    className="hidden sm:inline-flex rounded-full"
                  >
                    <CalendarDays className="h-5 w-5" />
                  </Button>
                </TooltipTrigger>
                <TooltipContent>Calendar</TooltipContent>
              </Tooltip>

              {/* Announcements */}
              <Tooltip>
                <TooltipTrigger asChild>
                  <Button
                    asChild
                    variant="ghost"
                    size="icon"
                    className="rounded-full"
                  >
                    <Link to="/announcements" search={{ page: undefined }}>
                      <Megaphone className="h-5 w-5" />
                    </Link>
                  </Button>
                </TooltipTrigger>
                <TooltipContent>Announcements</TooltipContent>
              </Tooltip>

              {/* Messages */}
              <Tooltip>
                <TooltipTrigger asChild>
                  <Button
                    variant="ghost"
                    size="icon"
                    className="hidden sm:inline-flex rounded-full"
                  >
                    <MessageSquareMore className="h-5 w-5" />
                  </Button>
                </TooltipTrigger>
                <TooltipContent>Messages</TooltipContent>
              </Tooltip>
            </div>
          </TooltipProvider>

          <DropdownMenuProfile />

          {/* Mobile Menu */}
          <Sheet>
            <SheetTrigger asChild>
              <Button
                variant="ghost"
                size="icon"
                className="md:hidden"
              >
                <Menu />
              </Button>
            </SheetTrigger>

            <SheetContent side="right" className="w-64">
              <nav className="flex flex-col gap-4 mt-6">
                {navMenu.map((item) => (
                  <Link
                    key={item.name}
                    to={item.url}
                    className="text-sm font-medium hover:text-primary"
                  >
                    {item.name}
                  </Link>
                ))}
              </nav>
            </SheetContent>
          </Sheet>
        </div>
      </div>
    </header>
  )
}
