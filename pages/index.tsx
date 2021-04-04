import Head from 'next/head'
import Link from 'next/link'
import Layout from 'components/Layout'
import FeedSlot from 'components/FeedSlot'

export default function Home() {
  return (
    <Layout>
      <Head>
        <title>On Deck Newsfeed</title>
      </Head>
      <h1>On Deck Newsfeed</h1>
      <p>Welcome to On Deck community platform 🤷</p>
     <FeedSlot/>
    </Layout>
  )
}
