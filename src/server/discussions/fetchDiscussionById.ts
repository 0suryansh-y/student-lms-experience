import { createServerFn } from '@tanstack/react-start';
import { eq } from 'drizzle-orm';
import { db } from '@/db';
import { discussions } from '@/db/schema';

export const fetchDiscussionById = createServerFn({ method: "GET" })
  .inputValidator((data: { discussionId: number }) => data)
  .handler(async ({ data }) => {
    const result = await db
      .select()
      .from(discussions)
      .where(eq(discussions.id, data.discussionId))

    if (result.length === 0) {
      throw new Error("ASSIGNMENT_NOT_FOUND")
    }

    return result
  })
