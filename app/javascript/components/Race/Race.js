import React, { useState, useEffect } from 'react'
import axios from 'axios'
import Order from './Order'
import Header from './Header'

const Race = (props) => {
  const [race, setRace] = useState({})
  const [orders, setOrders] = useState([])
  const [loaded, setLoaded] = useState(false)

  useEffect(() => {
    const url = props.match.url
    axios.get(`/api/v1/${url}`)
    .then( response => {
      setRace(response.data)
      setOrders(response.data.included)
      setLoaded(true)
    })
    .catch( error => console.log(error))
  },[])

  const grid = orders.map(item => {
    return (
      <Order 
      key={item.id}
      id={item.id}
      attributes={item.attributes}
      />
    )
  })

  const Display = () => {
    return (
      <div>
        <Header 
        key={ race.data.attributes.name } 
        attributes={ race.data.attributes }
        />
        { grid }
      </div>
    )
  }

  return (
    <div>
      { loaded && <Display/> }
    </div>
  )
}

export default Race