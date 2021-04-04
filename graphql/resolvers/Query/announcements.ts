import db, {AnnouncementRow} from '../../db'

type Args = {
  fellowship: String;
  limit: number;
  skip: number;
}

export default async function announcements(parent: unknown, {fellowship, limit, skip}: Args): Promise<AnnouncementRow[]> {
  const announcements: AnnouncementRow[] = await db.getAll(
    `
      SELECT a.id, a.fellowship, a.title, a.body, a.created_ts, a.updated_ts
      FROM announcements a
      WHERE a.fellowship = 'all' or a.fellowship = ?
      order by updated_ts desc 
      limit ${skip},${limit}
    `,
    [fellowship]
  )
  return announcements;
}
