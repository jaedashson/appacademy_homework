import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  };

  handleSubmit(e) {
    e.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }

  handleChange(e) {
    this.setState({ searchTerm: e.currentTarget.value })
  }

  render() {
    return (
      <div>
        <form className="search-bar" onSubmit={this.handleSubmit}>
          <label> Search term
            <input type="text" onChange={this.handleChange}/>
          </label>
          <button>Search!</button>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  };
}

export default GiphysSearch;