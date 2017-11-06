import { ApolloClient } from "apollo-client";
import { createHttpLink } from "apollo-link-http";
import { InMemoryCache } from "apollo-cache-inmemory";

const link = createHttpLink({
  uri: "/graphql",
  credentials: "same-origin"
});

const cache = new InMemoryCache({
  dataIdFromObject: result => {
    if (result.id && result.__typename) {
      return result.__typename + result.id;
    }
    return null;
  },
  addTypename: true,
  cacheResolvers: {}
});

const client = new ApolloClient({
  link,
  cache: cache.restore(window.__APOLLO_CLIENT__),
  connectToDevTools: true
});

export default client;
