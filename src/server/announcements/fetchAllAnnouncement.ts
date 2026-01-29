import { createServerFn } from '@tanstack/react-start';
import { and, desc, eq } from 'drizzle-orm';
import type { InferSelectModel } from 'drizzle-orm'
import { db } from '@/db';
import { announcements } from '@/db/schema';
import { PAGINATION_PAGE_SIZE } from '@/globalSettings';

export type AnnouncementsType = InferSelectModel<typeof announcements>


export const fetchAllAnnouncements = createServerFn({ method: "GET" })
  .inputValidator(
    (data: { batchId?: number | null; page?: number }) => data
  )
  .handler(async ({ data }) => {
    console.log("📥 Request reached server for batch", data.batchId)

    try {
      const page = data.page ?? 1
      const offset = (page - 1) * PAGINATION_PAGE_SIZE

      const conditions = [
        data.batchId != null
          ? eq(announcements.batchId, data.batchId)
          : undefined,
      ].filter(Boolean)

      const rows = await db
        .select()
        .from(announcements)
        .where(and(...conditions))
        .orderBy(desc(announcements.createdAt))
        .limit(PAGINATION_PAGE_SIZE)
        .offset(offset)

      console.log("🙈", rows)
      return rows
    } catch (err) {
      console.error("🔥 Server/DB error", err)
      throw new Error("SERVER_ERROR_FETCHING_LECTURES")
    }
  })
