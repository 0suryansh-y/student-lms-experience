import { createServerFn } from '@tanstack/react-start';
import { desc, eq, inArray } from 'drizzle-orm';
import type { InferSelectModel } from 'drizzle-orm'
import { db } from '@/db';
import { batchUser, batches } from '@/db/schema';

export type CourseType = InferSelectModel<typeof batches>

// TODO: Fetch only 10 enteries at a time. Make another request on scrollend

export const fetchAllCourses = createServerFn({ method: "GET" })
  .inputValidator((data: { userId: number }) => data)
  .handler(async ({ data }) => {

    try {

      const userBatches = await db
        .select()
        .from(batchUser)
        .where(eq(batchUser.userId, data.userId))


      if (userBatches.length === 0) return [];

      const batchIds = userBatches.map((row) => row.batchId);

      const batchesData = await db
        .select()
        .from(batches)
        .where(inArray(batches.id, batchIds))
        .orderBy(desc(batches.createdAt))

      return batchesData

  } catch (err) {
    console.error("🔥 Server/DB error", err)

    throw new Error("SERVER_ERROR_FETCHING_LECTURES")
  }
  })
