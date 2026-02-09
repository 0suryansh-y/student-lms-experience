import { createFileRoute } from '@tanstack/react-router'
import { Button } from '@/components/ui/button'

export const Route = createFileRoute('/(protected)/_layout/masaiverse/')({
  component: RouteComponent,
})

function RouteComponent() {
  return (
    <div className='bg-white border rounded-xl mx-[clamp(16px,6.25vw,80px)] mt-12 flex flex-col items-center justify-center min-h-[700px]'>
      <img src="/Masaiverse.svg" alt="masai-icon" className='h-48 w-48' />
      <p className='font-bold text-2xl'>Join the MasaiVerse Discord Community</p>
      <p className='font-semibold py-6 text-[#374151] max-w-[40ch] text-center'>Be a part of a thriving community where learners feel inspired, supported, and celebrated.</p>
      <Button className="bg-[#6962AC] text-white hover:bg-[#5A539C] transition-colors p-6 text-lg">
        <img src="/DiscordSymbol.svg" alt="discord-icon"/>
        Join MasaiVerse Community
      </Button>
      <div className='mt-8 bg-[#F9FAFB] p-6 px-48 flex rounded-xl text-lg'>
        <p className='text-[#374151] mx-2'>Already a member?</p>
        <p className='text-[#6962AC] underline underline-offset-4 cursor-pointer'>Open Discord App</p>
      </div>
    </div>
  )
}
