import React from 'react';

import { styles } from './styles'

const Header = (props) => {
  return (
    <div>
      <div style={styles.Header}>
        {props.attributes.name}
      </div>
      <div style={styles.SubHeading}>
        {props.attributes.date}
      </div>
    </div>
  )
};

export default Header;