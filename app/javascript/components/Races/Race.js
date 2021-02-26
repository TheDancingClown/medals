import React from 'react';

const Race = (props) => {
  return (
    <div>
      <div className="event-name">{ props.attributes.name }</div>
      <div className="event-date">{ props.attributes.date }</div>
    </div>
  )
};

export default Race;