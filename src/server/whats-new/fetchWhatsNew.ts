import { createServerFn } from '@tanstack/react-start';
import type { InferSelectModel } from 'drizzle-orm'
import { db } from '@/db';
import { whatsnew } from '@/db/schema';

export type WhatsNewType = InferSelectModel<typeof whatsnew>


export const fetchWhatsNew = createServerFn({ method: "GET" })
  .handler(async () => {

    try {

      const rows = await db
        .select()
        .from(whatsnew)
    
        console.log("😩", rows)
      return rows
    } catch (err) {
      console.error("🔥 Server/DB error", err)
      throw new Error("SERVER_ERROR_FETCHING_LECTURES")
    }
  })
