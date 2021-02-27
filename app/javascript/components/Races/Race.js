import React from 'react';
import { BrowserRouter as  Router, Link } from 'react-router-dom'

const Race = (props) => {
  return (
    <div>
      <div className="event-name">{ props.attributes.name }</div>
      <div className="event-date">{ props.attributes.date }</div>
      <Link to={`/races/${props.attributes.slug}`}>View</Link>
    </div>
  )
};

export default Race;