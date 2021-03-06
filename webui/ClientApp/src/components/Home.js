import React, { Component } from 'react';

export class Home extends Component {
    static displayName = Home.name;

    constructor(props) {
        super(props);
        this.state = { people: [], sysinfo: '', peopleloading: true, osloading: true };
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
    static renderOSInfoMessage(data) {
        return (
            <div>
            OS: <span className="osinfo">{data.osDescription}</span><br />
            <strong>OS Arch:</strong> {data.osArchitecture}  <strong>Proc Arch:</strong> {data.processorArchitecture} <strong>.net:</strong> {data.frameworkDescription}
            </div>
        );
    }

    render() {
        let peoplecontent = this.state.peopleloading
            ? <span><em>Loading People...</em></span>
            : Home.renderPeopleTable(this.state.people);

        let osinfocontent = this.state.osloading
            ? <span><em>Loading OS Info...</em></span>
            : Home.renderOSInfoMessage(this.state.sysinfo);

        return (
            <div>

                <div className="jumbotron d-flex flex-column justify-content-between">
                    <div className="p-2 d-flex flex-row justify-content-between">
                        <div className="p-2"><h1 className="display-4">Hello, TechExchange!</h1></div>
                        <div className="p-2"><img className="logo" alt="vscode and docker logo" src="/vscodedocker.png" /></div>
                    </div>
                    <div className="p-2">
                        <div className="lead">{osinfocontent}</div>
                    </div>
                </div>
                <br />
                <br />
                <h2 id="tabelLabel">People</h2>
                <p>data returned from a service</p>
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
        const response = await fetch('data/GetSystemInfo');
        const data = await response.json();
        console.log(data);
        this.setState({ sysinfo: data, osloading: false });
    }
}
