import React, { useState, useEffect } from 'react';
import axios from 'axios'
import Race from './Race'

const Races = () => {
  const [races, setRaces] = useState([])

  useEffect(() => {
    axios.get("/api/v1/races.json")
    .then( response => {
      setRaces(response.data.data)
    })
    .catch( error => console.log(error))
  },[races.length])

  const grid = races.map(item => {
    return (
      <Race 
      key={item.attributes.id}
      attributes={item.attributes}
      />
    )
  })

  return (
    <div>
      { grid }
    </div>
  )
};

export default Races;