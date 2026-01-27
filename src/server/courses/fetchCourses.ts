import type { Course } from "@/types"

// ---- mock fetcher (replace with serverFn / API) ----
export async function fetchCourses(): Promise<Array<Course>> {
  await new Promise((r) => setTimeout(r, 1200))
  return [
    {
      id: "1",
      title: "Product Management with Generative & Agentic AI",
      org: "BITSOM",
      progress: 49,
      cta: "resume",
      image: "https://coding-platform.s3.amazonaws.com/dev/lms/tickets/02d36cfe-3ecd-4bce-9953-6458747163bd/aRpFgjQxjivZqPmJ.jpg",
    },
    {
      id: "2",
      title: "ML with Python: from Linear Models to Deep Learning",
      org: "IIT Delhi",
      progress: 70,
      cta: "start",
      image: "https://coding-platform.s3.amazonaws.com/dev/lms/tickets/fd5843bd-2618-4c30-8ec3-f13370cdf89a/GWIQeL3mjazkkHKV.jpg",
    },
    {
      id: "3",
      title: "Data Science and Machine Learning",
      org: "IIT Kanpur",
      progress: 20,
      cta: "start",
      image: "https://coding-platform.s3.amazonaws.com/dev/lms/tickets/71bc1d76-9c7f-45da-a242-7ba3a7576877/EjDdvWg3ZIrZRWxF.jpg",
    }
  ]
}