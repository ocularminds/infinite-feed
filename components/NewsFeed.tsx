import styled from 'styled-components'
import Date from './Date';
import Card from './Card'
import Markdown from './Markdown'
import { Feed, FeedProps } from "../pages/Payload";
import ProjectCard from './ProjectCard';
import UserCard from './UserCard';

type Props = {
  feeds: Feed[];
}

const NewsCard = ({ feed }: FeedProps) => (
  <Card>
    <Columns>
      <Content>
        <h2>{feed.title}</h2>
        <small><Date text={feed.updated_ts} /></small>
        <Markdown>{feed.body}</Markdown>
      </Content>
    </Columns>
  </Card>
);

const renderCard = (feed: Feed) => {
  if (feed.body) return <NewsCard key={`announcement-${feed.id}`} feed={feed} />
  if (feed.description) return <ProjectCard key={`project-${feed.id}`} project={feed} />
  if (feed.name) return <UserCard key={`user-${feed.id}`} user={feed} />
  return null;
}

export default function NewsFeed({ feeds }: Props) {
  return (
    <Container>
      {feeds.map((feed) => renderCard(feed))}
    </Container>
  )
}

const Container = styled.article`
  width: 600px;
  padding: 0 1rem;
  margin: 0;  
  display: center;
  `

const Columns = styled.div`
  display: flex;
  flex-direction: row;
  min-width: 28rem;
`
const Content = styled.div`
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  flex-shrink: 0;
  flex-basis: 28rem;
`