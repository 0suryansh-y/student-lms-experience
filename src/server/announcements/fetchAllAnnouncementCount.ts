import { createServerFn } from '@tanstack/react-start';
import { and, eq, sql } from "drizzle-orm";
// import type { InferSelectModel } from "drizzle-orm";
import { db } from '@/db';
import { announcements } from '@/db/schema';

export const fetchAllAnnouncementCount = createServerFn({ method: "GET" })
    .inputValidator((data: { batchId: number | null }) => data)
    .handler(async ({ data }) => {
        const conditions = [
            ...(data.batchId !== null
                ? [eq(announcements.batchId, data.batchId)]
                : []),
        ]

        const result = await db
            .select({
                count: sql<number>`count(*)`,
            })
            .from(announcements)
            .where(and(...conditions))

        console.log("Row count ❤️", result[0].count)

        return result[0].count
    })
