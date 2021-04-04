# Infinite-Feed

A newsfeed portal for On-Desk fellowships showing new and relevant events. The goal is to keep users up to date and to facilitate collaboration between them. The project implements the following:

- Newsfeed including new users, projects, and announcements.
- Different results, depending on the selected fellowship.
- Sorted entries by creation date, newer entries go first.
- Infinite scrolling: it doesn't download and display all entries at once.

## Getting started with the repo

1. Clone it: `git clone git@github.com/ocularminds/infinite-feed.git`
2. Open the folder: `cd infinite-feed`
3. Install the dependencies: `yarn install`
4. Run the dev server: `yarn dev`
5. Open http://localhost:3000

## Project structure

Tech stack:
- Next.js,
- TypeScript,
- Sqlite3,
- Apollo server,
- Apollo client,
- React.

Folder structure:
- `components/` — reusable React components;
- `pages/` — the usual Next.js [page structure](https://nextjs.org/docs/basic-features/pages);
- `graphql/` — GraphQL server, schema, resolvers, DB connection;
- `scripts/` — contains the SQL script used for creating and populating the tables in `db.sqlite`.

The database is already included in the repo (`db.sqlite`) and populated (`scripts/populate.sql`). Its basic structure:
- `users` — people participating in fellowships;
- `projects` — projects that founders are working on (connected to `users` through `user_projects`);
- `announcements` — announcements targeting specific fellowships or global (`fellowship = "all"`).
  