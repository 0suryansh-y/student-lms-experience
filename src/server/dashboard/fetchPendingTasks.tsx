import { createServerFn } from '@tanstack/react-start'
import { and, eq, gt, inArray, isNull, lt, ne, or, sql } from 'drizzle-orm'
import type { InferSelectModel } from "drizzle-orm";
import { db } from '@/db'
import { assignments, batchUser, submissions } from '@/db/schema'

const istNow = sql`
  DATE_ADD(NOW(), INTERVAL 330 MINUTE)
`

export type PendingTaskRow = {
  assignments: InferSelectModel<typeof assignments>;
  submissions: InferSelectModel<typeof submissions>;
};

export const fetchPendingTasks = createServerFn({ method: 'GET' })
    .inputValidator((data: { userId: number }) => data)
    .handler(async ({ data }) => {
        try {

            // await new Promise((r) => setTimeout(r, 10000));

            /* 1️⃣ Get all batch IDs for the user */
            const batchs = await db
                .select({ batchId: batchUser.batchId })
                .from(batchUser)
                .where(eq(batchUser.userId, data.userId))

            const batchIds = batchs.map(s => s.batchId)

            if (!batchIds.length) return []

            /* 2️⃣ Get active assignments for those batchs */
            const activeAssignments = await db
                .select()
                .from(assignments)
                .where(
                    and(
                        inArray(assignments.batchId, batchIds),
                        lt(assignments.schedule, istNow),
                        gt(assignments.concludes, istNow)
                    )
                )

            const assignmentIds = activeAssignments.map(a => a.id)


            console.log(assignmentIds, "👾")

            if (!assignmentIds.length) return []

            /* 3️⃣ Get pending submissions */

            const pendingAssignments = await db
                .select()
                .from(assignments)
                .innerJoin(
                    submissions,
                    eq(submissions.assignmentId, assignments.id)
                )
                .where(
                    and(
                        inArray(assignments.id, assignmentIds),
                        eq(submissions.userId, data.userId),
                        ne(submissions.status, "submitted"),
                        eq(submissions.completed, 0),
                        or(
                            eq(submissions.markAsCompleted, 0),
                            isNull(submissions.markAsCompleted)
                        )
                    )
                );


            return pendingAssignments
        } catch (err) {
            console.error('🔥 Server/DB error', err)
            throw new Error('SERVER_ERROR_FETCHING_PENDING_TASKS')
        }
    })
