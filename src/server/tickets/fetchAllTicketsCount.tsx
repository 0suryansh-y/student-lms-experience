import { createServerFn } from '@tanstack/react-start';
import { eq, sql } from "drizzle-orm";
// import type { InferSelectModel } from "drizzle-orm";
import { db } from '@/db';
import { tickets } from '@/db/schema';

export const fetchAllTicketsCount = createServerFn({ method: "GET" })
    .inputValidator((data: { userId: number }) => data)
    .handler(async ({ data }) => {

        const result = await db
            .select({
                count: sql<number>`count(*)`,
            })
            .from(tickets)
            .where(eq(tickets.userId, data.userId))

        console.log("Row count ❤️", result[0].count)

        return result[0].count
    })
