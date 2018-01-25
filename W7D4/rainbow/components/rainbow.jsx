import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';

import Red from './red';
import Orange from './orange';
import Yellow from './yellow';
import Green from './green';
import Blue from './blue';
import Indigo from './indigo';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        {/* Your links should go here */}

        <div id="rainbow">
            <Route path="/red" exact component={Red} />
            <Route path="/red/orange" component={Orange} />
            <Route path="/red/yellow" component={Yellow} />
            <Route path="/green" component={Green} />
            <Route path="/blue" exact component={Blue} />
            <Route path="/blue/indigo" component={Indigo} />
            <Route path="/violet" component={Violet} />
        </div>
      </div>
    );
  }
}

export default Rainbow;
