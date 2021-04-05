import db, {Row} from '../../db'

type Args = {
  fellowship: String;
  limit: number;
  skip: number;
}

const getOrSkipProject = (fellowship: String) => {
    if(fellowship === 'angels' || fellowship === 'founders') {
        return `UNION ALL 
        SELECT id, name, Null as bio, description, icon_url, Null as fellowship, 
        Null as title,Null as avatar_url, Null as body, created_ts,updated_ts
        FROM projects`;        
    }
    return " ";
}

export default async function feeds(parent: unknown, {fellowship, limit, skip}: Args): Promise<Row[]> {
    console.log('fellowship', fellowship,'limit',limit,'skip',skip)
    const ANGELS_FOUNDERS = "WHERE fellowship = 'angels' OR fellowship = 'founders' ";
    const WRITERS_ONLY = "WHERE fellowship = 'writers'";
    const USERS_WHERE_CLAUSE = fellowship === "writers"? WRITERS_ONLY:ANGELS_FOUNDERS;
    const feeds: Row[] = await db.getAll(`
      SELECT id, Null as name, Null as bio, null as description, null as icon_url, fellowship, 
      title,Null as avatar_url, body, created_ts, updated_ts
      FROM announcements 
      WHERE fellowship = 'all' or fellowship = ?
      UNION ALL
      SELECT id,name,bio, Null as description, null as icon_url,fellowship, 
      Null as title, avatar_url, Null as body,created_ts,updated_ts
      FROM users ${USERS_WHERE_CLAUSE}        
      ${getOrSkipProject(fellowship)}
      order by created_ts desc limit ${skip},${limit}
    `,
    [fellowship]
  )
  return feeds;
}
