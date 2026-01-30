import { createServerFn } from '@tanstack/react-start';
import { eq } from 'drizzle-orm';
import { db } from '@/db';
import { tickets } from '@/db/schema';

export const fetchTicketById = createServerFn({ method: "GET" })
  .inputValidator((data: { ticketId: number }) => data)
  .handler(async ({ data }) => {
    const result = await db
      .select()
      .from(tickets)
      .where(eq(tickets.id, data.ticketId))

    if (result.length === 0) {
      throw new Error("LECTURE_NOT_FOUND")
    }

    return result
  })
