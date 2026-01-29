import { createServerFn } from '@tanstack/react-start';
import { and, eq, like, sql } from "drizzle-orm";
// import type { InferSelectModel } from "drizzle-orm";
import { db } from '@/db';
import { discussions } from '@/db/schema';

export const fetchAllDiscussionsCount = createServerFn({ method: "GET" })
    .inputValidator((data: { entityId: number, entityType: string }) => data)
    .handler(async ({ data }) => {

        const result = await db
            .select({
                count: sql<number>`count(*)`,
            })
            .from(discussions)
            .where(
                and(
                    eq(discussions.entityId, data.entityId),
                    like(discussions.entityType, `%${data.entityType}%`)
                )
            )

        console.log("Row count ❤️", result[0].count)

        return result[0].count
    })
