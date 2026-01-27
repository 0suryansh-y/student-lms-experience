import { createServerFn } from '@tanstack/react-start';
import { desc } from 'drizzle-orm';
import type { InferSelectModel } from "drizzle-orm";
import { db } from '@/db';
import { discussions } from '@/db/schema';

export type Discussion = InferSelectModel<typeof discussions>;


export const fetchFiveDiscussions = createServerFn({ method: 'GET' })
  .handler(async () => {
    const data = await db
      .select()
      .from(discussions)
      .orderBy(desc(discussions.id))
      .limit(5);

    return data as Array<Omit<typeof data[0], 'data' | 'gptCentralData'> & { 
      data: Record<string, any> | null; 
      gptCentralData: Record<string, any> | null; 
    }>;
  });