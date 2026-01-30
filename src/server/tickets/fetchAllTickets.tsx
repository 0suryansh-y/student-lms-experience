import { createServerFn } from '@tanstack/react-start';
import { desc, eq } from 'drizzle-orm';
import type { InferSelectModel } from 'drizzle-orm'
import { db } from '@/db';
import { tickets } from '@/db/schema';
import { PAGINATION_PAGE_SIZE } from '@/globalSettings';

export type TicketType = InferSelectModel<typeof tickets>

export const fetchAllTickets = createServerFn({ method: "GET" })
  .inputValidator(
    (data: { userId: number; page?: number }) => data
  )
  .handler(async ({ data }) => {
    console.log("📥 Request reached server", data.page)

    try {
      const page = data.page ?? 1
      const offset = (page - 1) * PAGINATION_PAGE_SIZE

      const rows = await db
        .select()
        .from(tickets)
        .where(eq(tickets.userId, data.userId))
        .orderBy(desc(tickets.createdAt))
        .limit(PAGINATION_PAGE_SIZE)
        .offset(offset)

      console.log("🙈", rows)
      return rows
    } catch (err) {
      console.error("🔥 Server/DB error", err)
      throw new Error("SERVER_ERROR_FETCHING_LECTURES")
    }
  })
