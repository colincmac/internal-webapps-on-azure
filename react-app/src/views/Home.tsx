import React from "react";
import appConfig from "../libs/appConfig";

function Home() {
  return <div>{appConfig.greeting}</div>;
}

export default Home;
