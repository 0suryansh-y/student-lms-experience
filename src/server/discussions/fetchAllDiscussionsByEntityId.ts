import { createServerFn } from '@tanstack/react-start';
import { and, desc, eq, like } from 'drizzle-orm';
import type { InferSelectModel } from 'drizzle-orm'
import { db } from '@/db';
import { discussions } from '@/db/schema';
import { PAGINATION_PAGE_SIZE } from '@/globalSettings';

export type DiscussionType = InferSelectModel<typeof discussions>


export const fetchAllDiscussionsByEntityId = createServerFn({ method: "GET" })
  .inputValidator(
    (data: { entityId: number; entityType: string; page?: number }) => data)
  .handler(async ({ data }) => {

    try {
      console.log("📥 Request reached server for batch", data.entityId + "->" + data.entityType)
      const page = data.page ?? 1
      const offset = (page - 1) * PAGINATION_PAGE_SIZE

      const rows = await db
        .select()
        .from(discussions)
        .where(
          and(
            eq(discussions.entityId, data.entityId),
            like(discussions.entityType, `%${data.entityType}%`)
          )
        )
        .orderBy(desc(discussions.createdAt))
        .limit(PAGINATION_PAGE_SIZE)
        .offset(offset)

      console.log("🙈", rows)
      return rows
    } catch (err) {
      console.error("🔥 Server/DB error", err)
      throw new Error("SERVER_ERROR_FETCHING_LECTURES")
    }
  })
