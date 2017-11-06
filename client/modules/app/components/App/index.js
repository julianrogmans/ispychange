import React from "react";
import { Switch, Route } from "react-router-dom";
import { themr } from "react-css-themr";

import appTheme from "./theme.scss";

export function App({ theme }) {
  return (
    <div className={theme.app}>
      <Switch>
        <Route exact path="/" component={Home} />
        <Route component={NotFound} />
      </Switch>
    </div>
  );
}

function Home() {
  return (
    <h4>
      I spy change
    </h4>
  )
}

function NotFound() {
  return (
    <h5 style={{ margin: 40 }}>
      Route not found
    </h5>
  );
}

export default themr("", appTheme)(App);
