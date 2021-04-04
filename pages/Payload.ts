
import { gql } from '@apollo/client'

export type QueryData = {
    feeds: [Feed];
}

export type QueryVars = {
    fellowship: any;
    limit: number;
    skip: number;
}

export type User = {
    id: number;
    name: string;
    avatar_url: string;
    projects: Project[];
}

export type Project = {
    id: number;
    name: string;
    icon_url: string;
}

export type Feed = {
    id: number;
    name: string;
    bio: string;
    avatar_url: string;
    fellowship: "founders" | "angels" | "writers";
    description: string;
    icon_url: string;
    title: string;
    body: string;
    created_ts: Date;
    updated_ts: Date;
    projects: [Project]
    users: [User]
}

export type UserProps = {
    user: Feed;
}

export type ProjectProps = {
    project: Project;
}

export type FeedProps = {
    feed: Feed;
}

export const GET_FEEDS = gql`
  query GET_FEEDS($fellowship: String!, $limit: Int!, $skip: Int!){
    feeds(fellowship: $fellowship, limit: $limit, skip: $skip) {
      ... on Announcement {
        id
        fellowship
        title
        body
        created_ts
        updated_ts
      }
      ... on Project {
        id
        name
        description
        created_ts
        updated_ts
        users {
          id
          name
        }
      }
      ... on User {
        id
        name
        bio
        avatar_url
        fellowship
        projects {
          id
          name          
          icon_url
        }
        created_ts
        updated_ts
      }
    }
  }  
`