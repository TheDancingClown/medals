import React from 'react';
import { Route, Switch } from 'react-router-dom'
import Races from './Races/Races'
import Race from './Race/Race'

const App = () => {
  
  return (
    <Switch>
      <Route exact path="/" component={ Races } />
      <Route exact path="/races/:slug" component={ Race } />
    </Switch>
    )
};

export default App;