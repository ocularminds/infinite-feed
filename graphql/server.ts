import {ApolloServer, gql} from 'apollo-server-micro'
import * as resolvers from './resolvers'

const typeDefs = gql`

  union Feed = Announcement | Project | User

  type Announcement {
    id: Int!
    fellowship: String!
    title: String!
    body: String
    created_ts: String!
    updated_ts: String!
  }

  type Project {
    id: Int!
    name: String!
    description: String
    icon_url: String!
    users: [User!]!
    created_ts: String!
    updated_ts: String!
  }

  type User {
    id: Int!
    name: String!
    bio: String
    avatar_url: String!
    fellowship: String!
    projects: [Project!]!
    created_ts: String!
    updated_ts: String!
  }

  type Query {
    project(id: Int!): Project!
    user(id: Int!): User!
    announcements(fellowship: String!, limit: Int!, skip: Int!): [Announcement!]!
    feeds(fellowship: String!, limit: Int!, skip: Int!): [Feed!]!
  }
`;

export const server = new ApolloServer({typeDefs, resolvers})
