# On Deck coding challenge: newsfeed

## Getting started with the repo

1. Clone it: `git clone git@github.com:on-deck/coding-challenge-newsfeed.git`
2. Open the folder: `cd coding-challenge-newsfeed`
3. Install the dependencies: `yarn install`
4. Run the dev server: `yarn dev`
5. Open http://localhost:3000

## Setting: what this toy project is about

This project portrays a simplified slice of On Deck community platform. 

We have users participating in three fellowships:
- Founders, modeled after the [On Deck Founders](https://www.beondeck.com/founders) program,
- [Angels](https://www.beondeck.com/angels),
- [Writers](https://www.beondeck.com/writers).

We want to create a newsfeed for each fellowship that shows new and relevant events. The goal is to keep users up to date and to facilitate collaboration between them.

In general, there are three types of events:
- new people (DB table `users`),
- new projects (table `projects`),
- team announcements (table `announcements`).

However, each newsfeed should consist of different types of content because people from different fellowships are interested in different events:
- Founders want to connect to angels and other founders.
- Angels want to connect to founders and other angels.
- Founders and angels are interested in new founders' projects.
- Writers want to connect only to other writers and are not interested in founders' projects.

Announcements can be addressed to a specific fellowship, or to all users (see table `announcements`, column `fellowship`). Founders are not interested in announcements addressed to writers, and so on.

## Part 1: coding task

Implement the newsfeed:
- It should include users, projects, and announcements.
- It should display different results, depending on the selected fellowship, as described in the "Setting" section above.
- Entries should be sorted by creation date, newer entries go first.
- Implement infinite scrolling, don't download and display all entries at once.

Tips:
- You can change any part of the application — DB connection, GraphQL server/client, styled-components — if you are more comfortable or productive with something else.
- You can change the project structure as you see fit.
- You can add any NPM package you need to implement new features or improve the existing code.
- You can reuse the existing React components, or modify them so they fit better in the newsfeed.
- Don't spend much time creating beautiful UI, just make it look consistent.

## Part 2: questions

Please submit written answers to these questions:
1. How could you modify the project setup to improve type safety, code reuse, testability, and general code quality?
2. What technical challenges do you see for the same project at scale? How would you address them? Assume there are tens of thousands of users in tens of different fellowships.
3. What product/UI challenges do you see for the same project at scale? How would you address them?

## How to submit

1. Use a separate repo for the solution. Don't fork it, use this [guide for mirrorong repos](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/duplicating-a-repository#mirroring-a-repository).
2. Create a short Loom recording of UI and code walk-through.
3. Write the answers to the questions in a Notion or any other kind of shared doc.
4. Send everything above via an email to your contact at On Deck.

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
- `announcements` — announcements by On Deck Team targeting specific fellowships or global (`fellowship = "all"`).
  