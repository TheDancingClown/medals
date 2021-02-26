import React from 'react';
import { Route, Switch } from 'react-router-dom'
import Races from './Races/Races'

const App = () => {
  
  return (
    <Switch>
      <Route exact path="/" component={ Races } />
    </Switch>
    )
};

export default App;