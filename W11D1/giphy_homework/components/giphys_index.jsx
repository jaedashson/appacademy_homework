import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => {
  const giphysIndexItems = giphys.map(giphy => <GiphysIndexItem key={giphy.id} giphy={giphy} />)
  
  return (
    <ul>
      {giphysIndexItems}
    </ul>
  );
};

export default GiphysIndex;