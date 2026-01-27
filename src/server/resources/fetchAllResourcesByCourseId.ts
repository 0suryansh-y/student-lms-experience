import type { Lecture } from "@/types"

// ---- mock fetcher (replace with serverFn / API) ----
export async function fetchAllResourcesByCourseId(courseId: string): Promise<Array<Lecture>> {
  await new Promise((r) => setTimeout(r, 1200))
  return [
  {
    id: 1,
    title: 'Case study on Netflix',
    author: 'Bharath Rao',
    dateRange: '13 Jan, 2:00 PM - 18 Jan, 2:00 PM',
    completionStatus: 'completed',
  },
  {
    id: 2,
    title: 'Product Fundamentals',
    author: 'Prof. Anvesh',
    dateRange: '13 Jan, 2:00 PM - 18 Jan, 2:00 PM',
    completionStatus: 'in-progress',
  },
  {
    id: 3,
    title: 'Prioritisation Frameworks in Product',
    author: 'Bharath Rao',
    dateRange: '13 Jan, 2:00 PM - 18 Jan, 2:00 PM',
    completionStatus: 'warning',
  },
  {
    id: 4,
    title: 'User Research Basics',
    author: 'Dr. Neha Sharma',
    dateRange: '15 Jan, 11:00 AM - 20 Jan, 11:00 AM',
    completionStatus: 'completed',
  },
  {
    id: 5,
    title: 'Metrics That Matter',
    author: 'Rohit Verma',
    dateRange: '16 Jan, 3:00 PM - 21 Jan, 3:00 PM',
    completionStatus: 'in-progress',
  },
  {
    id: 6,
    title: 'Design Thinking Workshop',
    author: 'Aditi Kulkarni',
    dateRange: '17 Jan, 10:00 AM - 22 Jan, 10:00 AM',
    completionStatus: 'completed',
  },
  {
    id: 7,
    title: 'Roadmapping Strategies',
    author: 'Bharath Rao',
    dateRange: '18 Jan, 1:00 PM - 23 Jan, 1:00 PM',
    completionStatus: 'warning',
  },
  {
    id: 8,
    title: 'Growth Experiments 101',
    author: 'Kunal Mehta',
    dateRange: '19 Jan, 4:00 PM - 24 Jan, 4:00 PM',
    completionStatus: 'in-progress',
  },
  {
    id: 9,
    title: 'Stakeholder Management',
    author: 'Prof. Anvesh',
    dateRange: '20 Jan, 12:00 PM - 25 Jan, 12:00 PM',
    completionStatus: 'completed',
  },
  {
    id: 10,
    title: 'Writing Effective PRDs',
    author: 'Sneha Iyer',
    dateRange: '21 Jan, 2:00 PM - 26 Jan, 2:00 PM',
    completionStatus: 'warning',
  },
  {
    id: 11,
    title: 'Analytics for Product Managers',
    author: 'Rohit Verma',
    dateRange: '22 Jan, 11:00 AM - 27 Jan, 11:00 AM',
    completionStatus: 'in-progress',
  },
  {
    id: 12,
    title: 'Go-to-Market Strategies',
    author: 'Aditi Kulkarni',
    dateRange: '23 Jan, 5:00 PM - 28 Jan, 5:00 PM',
    completionStatus: 'completed',
  },
  {
    id: 13,
    title: 'A/B Testing Deep Dive',
    author: 'Kunal Mehta',
    dateRange: '24 Jan, 3:00 PM - 29 Jan, 3:00 PM',
    completionStatus: 'warning',
  },
  {
    id: 14,
    title: 'Customer Journey Mapping',
    author: 'Dr. Neha Sharma',
    dateRange: '25 Jan, 10:00 AM - 30 Jan, 10:00 AM',
    completionStatus: 'in-progress',
  },
  {
    id: 15,
    title: 'Case Study on Spotify',
    author: 'Bharath Rao',
    dateRange: '26 Jan, 1:00 PM - 31 Jan, 1:00 PM',
    completionStatus: 'completed',
  },
]
}