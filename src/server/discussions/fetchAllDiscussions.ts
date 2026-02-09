import { createServerFn } from "@tanstack/react-start"
import { and, desc, eq, inArray, or } from "drizzle-orm"
import type { InferSelectModel } from "drizzle-orm"
import { db } from "@/db"
import {
  assignments,
  batchUser,
  discussions,
  lectures,
} from "@/db/schema"
import { PAGINATION_PAGE_SIZE } from "@/globalSettings"

export type DiscussionType = InferSelectModel<typeof discussions>

function capitalizeFirst(str?: string) {
  if (!str) return undefined
  return str.charAt(0).toUpperCase() + str.slice(1)
}

export const fetchAllDiscussions = createServerFn({ method: "GET" })
  .inputValidator(
    (data: {
      userId: number
      page?: number
      type?: "lecture" | "assignment" | "resources"
    }) => data
  )
  .handler(async ({ data }) => {
    try {
      console.log("📥 Fetching discussions for user", data.userId)

      const page = data.page ?? 1
      const offset = (page - 1) * PAGINATION_PAGE_SIZE

      const type = capitalizeFirst(data.type) as
        | "Lecture"
        | "Assignment"
        | "Resources"
        | undefined

      // 1️⃣ Get batch IDs for user
      const userBatches = await db
        .select({ batchId: batchUser.batchId })
        .from(batchUser)
        .where(eq(batchUser.userId, data.userId))

      if (!userBatches.length) return []

      const batchIds = userBatches.map(b => b.batchId)

      let lectureIds: Array<number> = []
      let assignmentIds: Array<number> = []

      // 2️⃣ Decide what IDs to fetch based on type
      if (type === undefined || type === "Lecture" || type === "Resources") {
        const lectureWhere =
          type === "Resources"
            ? eq(lectures.type, "reading")
            : type === "Lecture"
              ? and(
                  inArray(lectures.batchId, batchIds),
                  or(
                    eq(lectures.type, "video"),
                    eq(lectures.type, "live"),
                    eq(lectures.type, "other")
                  )
                )
              : inArray(lectures.batchId, batchIds)

        const lectureRows = await db
          .select({ id: lectures.id })
          .from(lectures)
          .where(lectureWhere)

        lectureIds = lectureRows.map(l => l.id)
      }

      if (type === undefined || type === "Assignment") {
        const assignmentRows = await db
          .select({ id: assignments.id })
          .from(assignments)
          .where(inArray(assignments.batchId, batchIds))

        assignmentIds = assignmentRows.map(a => a.id)
      }

      if (!lectureIds.length && !assignmentIds.length) return []

      // 3️⃣ Build discussion filters
      const discussionConditions = []

      if (lectureIds.length && type !== "Assignment") {
        discussionConditions.push(
          and(
            eq(discussions.entityType, "App\\Models\\Lecture"),
            inArray(discussions.entityId, lectureIds)
          )
        )
      }

      if (assignmentIds.length && type !== "Lecture" && type !== "Resources") {
        discussionConditions.push(
          and(
            eq(discussions.entityType, "App\\Models\\Assignment"),
            inArray(discussions.entityId, assignmentIds)
          )
        )
      }

      if (!discussionConditions.length) return []

      // 4️⃣ Fetch discussions
      const rows = await db
        .select()
        .from(discussions)
        .where(or(...discussionConditions))
        .orderBy(desc(discussions.createdAt))
        .limit(PAGINATION_PAGE_SIZE)
        .offset(offset)

      console.log("🙈 Discussions fetched:", rows.length)
      return rows
    } catch (err) {
      console.error("🔥 Server/DB error", err)
      throw new Error("SERVER_ERROR_FETCHING_DISCUSSIONS_FOR_USER")
    }
  })
