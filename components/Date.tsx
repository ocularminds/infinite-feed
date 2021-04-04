import { parseISO, format } from "date-fns";

export default function Date({text}){
    const date = parseISO(text);
    return <time dateTime={text}>{format(date, 'LLL d, yyyy')}</time>
}