import { Edit, Mail, MapPin } from "lucide-react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Separator } from "@/components/ui/separator"

export default function ProfilePage() {
  return (
    <div className="max-w-4xl mx-auto p-6 space-y-6">
      {/* Header */}
      <Card className="rounded-2xl shadow-sm">
        <CardContent className="flex flex-col sm:flex-row gap-6 p-6">
          <Avatar className="h-28 w-28">
            <AvatarImage src="https://github.com/shadcn.png" />
            <AvatarFallback>SY</AvatarFallback>
          </Avatar>

          <div className="flex-1 space-y-2">
            <h1 className="text-2xl font-semibold">Spider Man</h1>
            <p className="text-muted-foreground">Full Stack Developer</p>

            <div className="flex flex-wrap gap-2">
              <Badge variant="secondary">React</Badge>
              <Badge variant="secondary">TypeScript</Badge>
              <Badge variant="secondary">Node.js</Badge>
              <Badge variant="secondary">PostgreSQL</Badge>
            </div>

            <div className="flex flex-wrap gap-4 pt-2 text-sm text-muted-foreground">
              <div className="flex items-center gap-1"><Mail className="h-4 w-4" /> gmail@email.com</div>
              <div className="flex items-center gap-1"><MapPin className="h-4 w-4" /> India</div>
            </div>
          </div>

          <div className="flex sm:flex-col gap-2">
            <Button size="sm"><Edit className="h-4 w-4 mr-2" /> Edit Profile</Button>
            <Button size="sm" variant="outline">View Resume</Button>
          </div>
        </CardContent>
      </Card>

      {/* About */}
      <Card className="rounded-2xl">
        <CardHeader>
          <CardTitle>About</CardTitle>
        </CardHeader>
        <CardContent className="text-sm text-muted-foreground leading-relaxed">
          Passionate full‑stack developer with experience building scalable web applications using
          modern tools like React, TanStack Router, Drizzle ORM, and shadcn/ui. Enjoys clean UI,
          strong typing, and well‑structured backend systems.
        </CardContent>
      </Card>

      {/* Stats + Links */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-6">
        <Card className="rounded-2xl">
          <CardContent className="p-6 text-center">
            <p className="text-2xl font-semibold">4+</p>
            <p className="text-sm text-muted-foreground">Years Experience</p>
          </CardContent>
        </Card>

        <Card className="rounded-2xl">
          <CardContent className="p-6 text-center">
            <p className="text-2xl font-semibold">20+</p>
            <p className="text-sm text-muted-foreground">Projects</p>
          </CardContent>
        </Card>

        <Card className="rounded-2xl">
          <CardContent className="p-6 text-center flex justify-center gap-4">
            {/* <Button size="icon" variant="outline"><Github className="h-4 w-4" /></Button>
            <Button size="icon" variant="outline"><Linkedin className="h-4 w-4" /></Button> */}
          </CardContent>
        </Card>
      </div>

      <Separator />

      {/* Activity */}
      <Card className="rounded-2xl">
        <CardHeader>
          <CardTitle>Recent Activity</CardTitle>
        </CardHeader>
        <CardContent className="space-y-3 text-sm">
          <div className="flex justify-between">
            <span>Created Assignment Discussion Page</span>
            <span className="text-muted-foreground">2 days ago</span>
          </div>
          <div className="flex justify-between">
            <span>Refactored TanStack Router Layout</span>
            <span className="text-muted-foreground">5 days ago</span>
          </div>
          <div className="flex justify-between">
            <span>Optimized Drizzle ORM Queries</span>
            <span className="text-muted-foreground">1 week ago</span>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
