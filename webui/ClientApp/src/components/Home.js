import React, { Component } from 'react';

export class Home extends Component {
  static displayName = Home.name;

  constructor(props) {
    super(props);
    this.state = { people: [], osinfo: '', peopleloading: true, osloading: true };
  }

  componentDidMount() {
    this.getPeople();
    this.getOsIfno();
  }

  static renderPeopleTable(people) {
    return (
      <div>
        <table className='table table-striped' aria-labelledby="tabelLabel">
          <thead>
            <tr>
              <th>First Name</th>
              <th>Last Name</th>
            </tr>
          </thead>
          <tbody>
            {people.map(person =>
              <tr key={person.id}>
                <td>{person.firstName}</td>
                <td>{person.lastName}</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    );
  }
  static renderOSInfoMessage(osinfo) { 
   return (<p>This dotnet core app is running in: {osinfo} </p>);
  }

  render() {
    let peoplecontent = this.state.peopleloading
      ? <p><em>Loading People...</em></p>
      : Home.renderPeopleTable(this.state.people);

      let osinfocontent = this.state.osloading
      ? <p><em>Loading OS Info...</em></p>
      : Home.renderOSInfoMessage(this.state.osinfo);      

    return (
      <div>
        <h1>Hello, TechExchange!</h1>
        {osinfocontent}


        <h1 id="tabelLabel">People</h1>
        {peoplecontent}
      </div>
    );
  }

  async getPeople() {
    const response = await fetch('data');
    const data = await response.json();
    this.setState({ people: data, peopleloading: false });
  }

  async getOsIfno() { 
    const response = await fetch('data/getosinfo');
    const data = await response.json();
    this.setState({ osinfo: data.description, osloading: false });
  }
}
