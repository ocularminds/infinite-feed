import marked from 'marked'
import styled from 'styled-components'

type Props = {
  children: string;
}

export default function Markdown({children}: Props) {
  const __html = marked(children)
  return (
    <MarkdownContainer dangerouslySetInnerHTML={{__html}} />
  )
}

const MarkdownContainer = styled.div``
