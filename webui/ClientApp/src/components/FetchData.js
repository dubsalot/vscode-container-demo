import React, { Component } from 'react';

export class FetchData extends Component {
    static displayName = FetchData.name;

    constructor(props) {
        super(props);
        this.state = { people: [], peopleloading: true };
    }

    componentDidMount() {
        this.getPeople();
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

    render() {
        let peoplecontent = this.state.peopleloading
            ? <p><em>Loading People...</em></p>
            : FetchData.renderPeopleTable(this.state.people);

        return (
            <div>
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
}
