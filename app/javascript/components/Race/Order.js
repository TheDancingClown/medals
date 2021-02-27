import React from 'react';
import { BrowserRouter as Link } from 'react-router-dom'

const Order = (props) => {
  return (
    <div>
      <div className="order-number">Order #{ props.id }</div>
      <div className="order-owner">Placed by { props.attributes.runner.name }</div>
      { props.attributes.completed && 
        <div>Completed</div>
      }
      {/* <Link to={`/races/${props.attributes.slug}`}>View</Link> */}
    </div>
  )
};

export default Order;
