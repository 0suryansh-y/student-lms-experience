import { createServerFn } from "@tanstack/react-start"
import { and, eq, inArray, or, sql } from "drizzle-orm"
import { db } from "@/db"
import {
  assignments,
  batchUser,
  discussions,
  lectures,
} from "@/db/schema"

function capitalizeFirst(str?: string) {
  if (!str) return undefined
  return str.charAt(0).toUpperCase() + str.slice(1)
}

export const fetchAllDiscussionsCount = createServerFn({ method: "GET" })
  .inputValidator(
    (data: {
      userId: number
      type?: "lecture" | "assignment" | "resources"
    }) => data
  )
  .handler(async ({ data }) => {
    try {
      console.log("📥 Counting discussions for user", data.userId)

      const type = capitalizeFirst(data.type) as
        | "Lecture"
        | "Assignment"
        | "Resources"
        | undefined

      // 1️⃣ Get batch IDs
      const userBatches = await db
        .select({ batchId: batchUser.batchId })
        .from(batchUser)
        .where(eq(batchUser.userId, data.userId))

      if (!userBatches.length) return 0

      const batchIds = userBatches.map(b => b.batchId)

      let lectureIds: Array<number> = []
      let assignmentIds: Array<number> = []

      // 2️⃣ Fetch lecture IDs (conditional)
      if (type === undefined || type === "Lecture" || type === "Resources") {
        const lectureWhere =
          type === "Resources"
            ? and(
                inArray(lectures.batchId, batchIds),
                eq(lectures.type, "reading")
              )
            : type === "Lecture"
              ? and(
                  inArray(lectures.batchId, batchIds),
                  sql`${lectures.type} != 'reading'`
                )
              : inArray(lectures.batchId, batchIds)

        const lectureRows = await db
          .select({ id: lectures.id })
          .from(lectures)
          .where(lectureWhere)

        lectureIds = lectureRows.map(l => l.id)
      }

      // 3️⃣ Fetch assignment IDs (conditional)
      if (type === undefined || type === "Assignment") {
        const assignmentRows = await db
          .select({ id: assignments.id })
          .from(assignments)
          .where(inArray(assignments.batchId, batchIds))

        assignmentIds = assignmentRows.map(a => a.id)
      }

      if (!lectureIds.length && !assignmentIds.length) return 0

      // 4️⃣ Build discussion filters
      const discussionConditions = []

      if (lectureIds.length && type !== "Assignment") {
        discussionConditions.push(
          and(
            eq(discussions.entityType, "App\\Models\\Lecture"),
            inArray(discussions.entityId, lectureIds)
          )
        )
      }

      if (
        assignmentIds.length &&
        type !== "Lecture" &&
        type !== "Resources"
      ) {
        discussionConditions.push(
          and(
            eq(discussions.entityType, "App\\Models\\Assignment"),
            inArray(discussions.entityId, assignmentIds)
          )
        )
      }

      if (!discussionConditions.length) return 0

      // 5️⃣ Count
      const result = await db
        .select({
          count: sql<number>`count(*)`,
        })
        .from(discussions)
        .where(or(...discussionConditions))

      console.log("🙈 Discussions count:", result[0]?.count)

      return result[0]?.count ?? 0
    } catch (err) {
      console.error("🔥 Server/DB error", err)
      throw new Error("SERVER_ERROR_FETCHING_DISCUSSION_COUNT_FOR_USER")
    }
  })
