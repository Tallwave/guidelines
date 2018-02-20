---
layout: default
title: "Tallwave Guidelines — Platforms — Web Apps"
---

[&larr; Home]({{ site.root }}/) &mdash; [Platforms]({{ site.root }}/Platforms)

# The Web

You may have heard of this thing called the Internet, it's getting rather popular. Web development is a giant ecosystem and while it'd be cool to have mastered all of it, that's not possible, not even close. Our Web development practice falls into a couple of areas:

## Application Development

### Front-end

With [React](https://facebook.github.io/react/) or [Angular.io](https://angular.io/) we can build robust web applications. React is more commonplace, but we do work with Angular 2+ as well. Common libraries used are:

 * [Redux](http://redux.js.org/)
   * When should you use redux? Redux is a powerful state management tool, but that comes at the cost of introducing additional [indirection](https://medium.com/@dan_abramov/you-might-not-need-redux-be46360cf367) and reducing readability. Make that tradeoff wisely. If an app can function fine with React's built-in state mechanics, use those. If a global state needs to exist, or if you find yourself traversing the state tree through many levels, consider using Redux.
 * [React Router](https://github.com/ReactTraining/react-router)
 * [Saga](https://github.com/redux-saga/redux-saga) or [Thunk](https://github.com/gaearon/redux-thunk)
 * [Bluebird](http://bluebirdjs.com/docs/getting-started.html) for better [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) performance.
 * [NGRX Store](https://github.com/ngrx/store)
   * Since NGRX Store is similar to Redux, the same caveats of its use apply here too.
 * And many more depending on the need of the particular project.

 These applications are generally built by [WebPack](https://webpack.github.io/) and written with ECMAScript 6, 7, or TypeScript.

### Back-end

Our preferred platform for writing APIs and integrating with other platforms is node.js, specifically [Hapi](https://hapijs.com/) and its surrounding ecosystem. Hapi's approach to development is incredibly well thought out and allows for full-control over the http request/response lifecycle, as well as enabling the developer to write succinct and well designed code.

Hapi by itself is not terribly interesting, but its power really comes through when it is used with the other libraries in its oeuvre:

 * [Joi](https://github.com/hapijs/joi) for object & schema validation.
 * [Boom](https://github.com/hapijs/boom) for quick error codes.
 * [Glue](https://github.com/hapijs/glue) a rather poorly documented, but incredibly powerful library for declaratively defining a server configuration.
 * [Confidence](https://github.com/hapijs/confidence) when paired with Glue allows for filtering and switching in Glue configurations.
 * [Nes](https://github.com/hapijs/nes) is the best websockets library out there.
 * [Wreck](https://github.com/hapijs/wreck) a great way to perform http requests.

 Databases:

 * [PostgreSQL](https://www.postgresql.org/) is preferred for relational data
 * [Mongo](https://www.mongodb.com/) is a great database for document based data.
 * [Redis](https://redis.io/) for caching and/or key/value storage.


