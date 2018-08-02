import React, { Component } from "react";
import "./App.css";
import Service from "./service";
import model from "./model";

class App extends Component {
  render() {
    return (
      <div className="App">
        <h1>new app</h1>
      </div>
    );
  }

  componentDidMount() {
    Service.init().then(() => {
      global.model = model;
      console.log(model);
    });
  }
}

export default App;
