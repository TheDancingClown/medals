import React, { useState, useEffect } from 'react'
import axios from 'axios'

const Race = (props) => {
  const [race, setRace] = useState({})
  const [orders, setOrders] = useState([])
  const [loaded, setLoaded] = useState(false)

  useEffect(() => {
    const url = props.match.url
    axios.get(`/api/v1/${url}`)
    .then( response => {
      console.log(response.data.included)
      setRace(response.data)
      setOrders(response.data.included)
      setLoaded(true)
    })
    .catch( error => console.log(error))
  },[])

  const list = orders.map(item => {
    return <li key={item.id}>{item.id} {item.attributes.name} {item.attributes.date} {item.attributes.time}</li>
  })

  return (
    <div>
      {loaded && 
      <div>
        <div>
          {race.data.attributes.name}
        </div>
      <div>
        {race.data.attributes.date}
      </div>
        <ul>{list}</ul>
      </div>
      }
    </div>
  )
}

export default Race