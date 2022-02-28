import React from "react";
import { useRoutes } from "react-router-dom";
import logo from "./logo.svg";
import "./App.css";
import Home from "./views/Home";
import Profile from "./views/Profile";

function App() {
  const routes = useRoutes([
    {
      index: true,
      element: <Home />,
    },
    {
      path: "/profile",
      element: <Profile />,
    },
  ]);
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        {routes}
      </header>
    </div>
  );
}

export default App;
