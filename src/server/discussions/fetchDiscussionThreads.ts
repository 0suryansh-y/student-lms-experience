import { createServerFn } from '@tanstack/react-start';
import { eq } from 'drizzle-orm';
import type { InferSelectModel } from 'drizzle-orm'
import { db } from '@/db';
import { threads } from '@/db/schema';

export type ThreadType = InferSelectModel<typeof threads>


export const fetchDiscussionThreads = createServerFn({ method: "GET" })
  .inputValidator((data: { discussionId: number }) => data)
  .handler(async ({ data }) => {

    await new Promise((r) => setTimeout(r, 3000))


    const result = await db
      .select()
      .from(threads)
      .where(eq(threads.discussionId, data.discussionId))

    if (result.length === 0) {
      throw new Error("ASSIGNMENT_NOT_FOUND")
    }

    return result
  })
