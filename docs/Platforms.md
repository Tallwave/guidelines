---
layout: default
title: "Tallwave Guidelines — Platforms"
---

[&larr; Home]({{ site.root }}/)

# Platforms

We focus on building software for three platforms: the web, mobile, and CMSes.

## The Web

You may have heard of this thing called the Internet, it's getting rather popular. Web development is a giant ecosystem and while it'd be cool to have mastered all of it, that's not possible, not even close. Our Web development practice falls into a couple of areas:

### Application Development

#### Front-end

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

#### Back-end

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


### Marketing Websites

A good marketing website can do so many things for our clients. It's the first thing their customers see so it:

 * Gives the first impression of brand, UX, and product.
 * If done properly, moves customers through the sales pipeline.
 * Serves as a portal to other products we may have built.
 * Demonstrates out abilities at web design and development.
 * Provides the customer with analytics and marketing knowledge.

A marketing site by its nature will have fewer moving parts than a full-fledged application. Its purpose is more to present information and drive fewer well-defined actions than require a high degree of input from the user. Thus, these websites do not involve heavy duty frameworks like React or Angular. We do tend to favor building these on WordPress, or plain HTML and CSS files. These are typically built using different libraries, frameworks, pre-processors, package managers, and toolkits:

 * [Bootstrap 4](https://v4-alpha.getbootstrap.com/) A CSS framework which can can be easily installed via [Node.js](https://nodejs.org/en/) and [npm](https://www.npmjs.com/).
 * [Foundation](http://foundation.zurb.com/sites/docs/) (6.4.0/latest version) Another excellent framework for web sites/non single-page apps because of its [Gulp](http://gulpjs.com/) and npm integration, ease-of-use and features. One benefit over Bootstrap is a gulpfile.js is already generated for you, so a Gulp recipe doesn't have to be made from scratch.
 * [Jekyll](https://jekyllrb.com/): Generates plain HTML and CSS and is useful if no database is required. It's also used to quickly prototype in conjunction with Bootstrap or Foundation frameworks. Tallwave has a a front-end build tool called [Quench](https://github.com/Tallwave/quench) to quickly spin up static web sites using Gulp, Jekyll, Sass and Bootstrap or Foundation.

## Mobile

We build mobile apps using native technologies, meaning that they interface directly with the libraries provided by the operating system, that being iOS and Android.

We do not recommend mobile apps built in a web browser. The level of fit and finish is not the same as you get from native. We do however use cross-platform frameworks where appropriate. For example, the following are some cross-platform libraries for the basic necessities of any mobile application:

* [Fabric](https://get.fabric.io/) - Crash reporting
    * This is essential for any mobile application, if you care about your user experience... and yourself when debugging bugs in production code. At Tallwave we aim for high quality, which includes a bold goal of 0.0% crashes.
* [Amplitude](https://amplitude.com/) - App metrics/events
    * Most of our clients aren't aware right away just how important it is to have insight into how the application is used in the real world. It's a trap to believe we know how people should, and would, use what we built; reality is often surprising. Part of [Agile](https://en.wikipedia.org/wiki/Agile_software_development), and [MVP](https://en.wikipedia.org/wiki/Minimum_viable_product), is to remain flexible through the entire process. Proper metrics are one of the sources of truth to know which direction to flex.
* [Realm](https://realm.io/) - Persistent local storage/database
    * Local storage is not a must have for all applications. Ideally things should be architected so that there isn't a need for local persistent data. But if necessary, Realm offers a great solution that is available on multiple platforms, including Android, iOS, and React Native.

### iOS Native Apps

The high adoption rate of new Apple technology, whether it's the latest devices or the latest OS, demands that we keep up with the latest tools and practices. We develop iOS applications using *XCode* with the latest version of *Swift*.

Instead of a simple [MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) Architecture, we've found that the [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) fits better with iOS views and view controllers. MVVM allows us to create applications that are easy to read, and scales well with an [Agile](https://en.wikipedia.org/wiki/Agile_software_development) method of software development.

For package and version control, we use [CocoaPods](https://cocoapods.org/), which is the most common method for developers to publish their iOS code (as of this writing). Below are some pods that we use as the foundation of our mobile applications:

* [RealmSwift](https://realm.io/docs/swift/latest/) - Realm offers a SQL-type store, similar to Core Data. It solves concurrency, like Core Data, with `Realm`s instead of `Context`s, but with a much easier interface and a simpler solution for creating and managing models. It also offers smooth decoding of JSON into a Realm objects, as long as the keys map directly.
* [Moya](https://github.com/Moya/Moya) - Moya abstracts the network layer into a set of simple Swift config structs, where you define your routers, their HTTP methods, and even test/mock responses that you can unit test. It uses Alamofire as its core network layer.
* [Locksmith](https://github.com/matthewpalmer/Locksmith) - Super simple library to abstract all your authentication keychain stuff.
* [CocoaLumberjack/Swift](https://github.com/CocoaLumberjack/CocoaLumberjack) - This is a life saver for logging debug info into an emailable text file. Great for those production bugs that are hidden deep in background executions, or the ones that the crash reports provides *zero* help with.

### Cross Platform Apps

Facebook's [React Native](https://facebook.github.io/react-native/) currently offers the best cross-platform solution to develop iOS and Android applications, using the same-ish code base. Same-*ish* because you can easily create an entirely different experience for your Android application than your iOS application. Each platform comes with their own `index.js` file, and they have the *option* of sharing components and behaviors.

The power of React Native is that you write interfaces that are translated to use the best native solutions under the hood. For example, iOS applications can use [NavigatorIOS](https://facebook.github.io/react-native/docs/navigatorios.html) which uses `UINavigationController` to give the same feel of a native iOS application.

When you compile your React Native code base, a project for both iOS and Android is provided. The common code is compiled into libraries that each project consumes. You can inter-mix natively written iOS or Android components, along with components created through React Native.

You'll also need either XCode or Android Studio to build and release the final product.

### Native or React Native?

Ideally, if you have two developers who are each strong in either iOS or Android, they can collaborate on the same codebase, sharing the same components, while maintaining the UX that is best for each platform. Usually the problem of any cross-platform solution is that Android users have to deal with iOS type elements, and vice-versa, providing a *worst of both worlds* outcome for users. React Native allows the developers to code different UX (such as navigation) for their Android or iOS users, while still sharing as much of the common elements as they can.

But, there is an overhead cost associated with using React Native. Where IDEs such as XCode and Android Studio have had years to optimize their toolset to solve all the common issues with building and releasing products, React Native forces developers to have to deal with npm packages, write code in simpler text editors such as Sublime, and all these need to be customized and optimized manually by the developers.

Also, where an XCode project can be 100 Megabytes, the same React Native project can be half a Gigabyte, taking mreactuch more memory and much longer to compile.

Sometimes these overhead costs, and headaches, cut into all the time saved in writing shared components in a single code base. But if the developer has a strong background of Node.js and React, then React Native is ideal for them to jumpstart mobile development.

## CMS

On today's Internet, content is king. You want to be the top search result on your favorite search engine, do you want to engage with your clients, do you want to expose your brand...Content! Bill Gates said "Content is where I expect much of the real money will be made on the Internet, just as it was in broadcasting."

In that essay Bill Gates goes on to say how its not just about to putting content on the internet. But its about putting relevant and innovative content. Producing great content and then having to spend money on developers to move that content to a browsers is not ideal. Cost too much money and too much time.

We fully embrace the idea of having our clients being able to manage and publish their content with relative ease. We strive to provide the best platform for our clients to be able to not worry about the tediousness of these two things.

Content Management Systems have join the world of web applications as a tool to solve the issue of managing and publishing content. And like any other trending technologies there is a lot of noise, and everyone seems to have a niche on how to solve the issues that arise from managing content. We focus on two platforms (**Drupal** and **WordPress**) mainly because of the size of the community that represents them. Having a large community means that the platforms are constantly being updated and checked for security issues. Platform that are continuously updated mean they are constantly evolving and progressing to become better at solving the problems they are built to solve, ie manage and publish content.

### WordPress

People often make the mistake of classifying WordPress as just a blogging platform. Although that used to be true in the past, WordPress has evolved through out the years into a versatile content management system (CMS). While you can still use WordPress to create a simple blog, now it also allows you to create fully functional websites and mobile applications.

The best part about WordPress is that it’s easy to use and flexible enough for just about anything. That’s the main reason why WordPress has grown so much in popularity.

One of the best features of WordPress is that it is out of the box free. That means you can download WordPress and with little to no development knowledge create a website for your brand to deliver content.

WordPress platforms allows us to develop custom plugins and themes for our clients to further drive the experience our clients want to provide their clients. Slowly WordPress is evolving to provide a better framework for development teams to create these customs experiences. Because developing custom plugins and themes for WordPress is not as straight forward as it could be, the community became saturated with plugins and themes that are very costly.

Because of the potential complexity and cost that involves providing a custom and unique experience for our clients clients, we focus on using WordPress on simpler experience. When all our clients care is to deliver content, and all they want is for their clients and potential users to be able to read content online, we use WordPress.

However as it stands, many times our clients want to not only provide a platform for their users to read their content, but they want to provide a platform where they can interact with their clients, in comes a more evolve platform **Drupal**.

### Drupal
* Version 7 or 8
* Why Drupal and not something like Expression Engine or Sitecore?
