import { createServerFn } from '@tanstack/react-start';
import { eq } from 'drizzle-orm';
import { db } from '@/db';
import { announcements } from '@/db/schema';

export const fetchAnnouncementById = createServerFn({ method: "GET" })
  .inputValidator((data: { announcementId: number }) => data)
  .handler(async ({ data }) => {
    const result = await db
      .select()
      .from(announcements)
      .where(eq(announcements.id, data.announcementId))

    if (result.length === 0) {
      throw new Error("ASSIGNMENT_NOT_FOUND")
    }

    return result
  })
