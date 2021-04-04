import { useQuery } from '@apollo/client'
import Layout from 'components/Layout'
import Card from 'components/Card'
import NewsFeed from 'components/NewsFeed'
import { useEffect, useState } from 'react'
import { GET_FEEDS, Feed, QueryData, QueryVars } from 'pages/Payload'

const MAX_FEEDS = 3;

const hasMoreFeeds = (page: number, limit: number, total: number) => {
  const startIndex = (page - 1) * limit + 1;
  return total === 0 || startIndex < total;
}

const initialParams = { currentPage: 1, skipped: 0, total: 0, fellowship: "founders" };

export default function FeedSlot() {
  const [isRendering, setIsRendering] = useState(false);
  const [pager, setPager] = useState(initialParams);
  const [total, setTotal] = useState(MAX_FEEDS);
  const [feeds, setFeeds] = useState(new Array<Feed>());

  const handleClick = (e: any)=> {
     e.preventDefault();
     const anchor = e.target.closest("a");   // Find closest Anchor (or self)
     if (!anchor) return;    
     let p = Object.assign({}, initialParams);
     p.fellowship = anchor.getAttribute('href');
     setPager(p);
  };

  const onWindowScroll = () => {
    const { scrollTop, scrollHeight, clientHeight } = document.documentElement;
    if (scrollTop + clientHeight >= scrollHeight - 5 &&
      hasMoreFeeds(pager.currentPage, MAX_FEEDS, total)) {
      let p = Object.assign({}, pager);
      p.currentPage = p.currentPage + 1;
      p.skipped = MAX_FEEDS * (p.currentPage - 1);
      setPager(p);
    }
  }

  const addFeeds = (data: any) => {
    if (!data.announcements) return;
    setIsRendering(true);
    setTimeout(() => {
      setIsRendering(false);
      setTotal(data.announcements.length);
      setFeeds(feeds.concat(data.announcements));
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
    skip: !pager.fellowship,
    variables: { fellowship: pager.fellowship, limit: MAX_FEEDS, skip: pager.skipped },
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
      <h2>Fellowship News</h2>
      <ul style={{listStyleType: "none", margin: 0, padding: 0}}>
        <li style={{display: "inline"}}><a href="angels" onClick={handleClick}>Angels</a></li>
        <li><a href="founders" onClick={handleClick}>Founders</a></li>
        <li><a href="writers" onClick={handleClick}>Writers</a></li>
      </ul>
      {(loading || isRendering) && <Card><p>...loading</p></Card>}
      <NewsFeed feeds={data.feeds} />
    </>
  )
}