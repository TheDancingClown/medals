import React, { useState, useEffect } from 'react';
import axios from 'axios'

const Races = () => {
  const [races, setRaces] = useState([])

  useEffect(() => {
    axios.get("/api/v1/races.json")
    .then( response => {
      setRaces(response.data.data)
    })
    .catch( error => console.log(error))
  },[races.length])

  const list = races.map(item => {
      return (<li key={item.attributes.slug }>{item.attributes.name}</li>)
    })

  return (
    <div>
      <h1>Races</h1>
      <ul>{ list }</ul>
    </div>
  )
};

export default Races;