import { useQuery } from '@apollo/client'
import styled from 'styled-components'
import Layout from 'components/Layout'
import Card from 'components/Card'
import NewsFeed from 'components/NewsFeed'
import { useEffect, useState } from 'react'
import { GET_FEEDS, Feed, QueryData, QueryVars } from 'pages/Payload'

const MAX_FEEDS = 3;

const hasMoreFeeds = (page: number, limit: number, total: number) => {
  //const startIndex = (page - 1) * limit + 1;
  if(total === 0 || total < limit){
    return false;
  };
  return true;
}

const initialParams = { currentPage: 1, skipped: 0};

export default function FeedSlot() {
  const [isRendering, setIsRendering] = useState(false);
  const [fellowship, setFellowship] = useState("founder");
  const [pager, setPager] = useState(initialParams);
  const [total, setTotal] = useState(MAX_FEEDS);
  const [feeds, setFeeds] = useState(new Array<Feed>());

  const handleClick = (e: any)=> {
     e.preventDefault();
     const anchor = e.target.closest("a");   // Find closest Anchor (or self)
     if (!anchor) return;    
     let p = Object.assign({}, initialParams);
     setFellowship(anchor.getAttribute('href'));
     console.dir(p);
     setTotal(MAX_FEEDS);
     setFeeds(new Array<Feed>());
     setPager(p);
  };

  const onWindowScroll = () => {
    const { scrollTop, scrollHeight, clientHeight } = document.documentElement;
    if (scrollTop + clientHeight >= scrollHeight - 5 &&
      hasMoreFeeds(pager.currentPage, MAX_FEEDS, total)) {
      let p = Object.assign({}, pager);
      p.currentPage = p.currentPage + 1;
      p.skipped = MAX_FEEDS * (p.currentPage - 1);
      console.dir(p);
      setPager(p);
    }
  }

  const addFeeds = (data: any) => {
    if (!data.feeds) return;
    setIsRendering(true);
    setTimeout(() => {
      setIsRendering(false);
      setTotal(data.feeds.length);
      setFeeds(feeds.concat(data.feeds));
    }, 1000);
  };

  useEffect(() => {
    window.addEventListener('scroll', onWindowScroll, { passive: true });
    return () => {
      window.removeEventListener('scroll', onWindowScroll);
    }
  }, []);

  const { data, error, loading } = useQuery<QueryData, QueryVars>(
    GET_FEEDS, {
    skip: !fellowship,
    variables: { fellowship: fellowship, limit: MAX_FEEDS, skip: pager.skipped },
    onCompleted: addFeeds
  }
  );
  if (loading) return <Layout><Card><p>...loading</p></Card></Layout>
  if (error) return <Layout><Card><p>Error</p></Card></Layout>
  if (!data?.feeds || loading || error) {
    return null
  }

  return (
    <>
      <Toolbar>
        <ToolTitle><Tool>Fellowship News</Tool></ToolTitle>
        <ToolbarItem><Tool href="angels" onClick={handleClick}>Angels</Tool></ToolbarItem>
        <ToolbarItem><Tool href="founders" onClick={handleClick}>Founders</Tool></ToolbarItem>
        <ToolbarItem><Tool href="writers" onClick={handleClick}>Writers</Tool></ToolbarItem>
      </Toolbar>
      {(loading || isRendering) && <Card><p>...loading</p></Card>}
      <NewsFeed feeds={feeds} />
    </>
  )
}

const Toolbar = styled.ul`
  width: 600px;
  list-style-type: none;
  background-color: #ffff;
`;

const ToolbarItem = styled.li`
  display: inline;
  padding: 10px;
  float: right;
`;

const ToolTitle = styled.li`
  display: inline;
  padding: 0px;
  float: left;
  font-weight:bold;
  font-size: 2em;
`;

const Tool = styled.a`
  display: block;
  padding: 8px 16px;
  text-decoration: none;
`;