---
layout: default
title: "Tallwave Guidelines — Quality"
---

[&larr; Home]({{ site.root }}/)

# Quality
There is a delicate balance between doing great work and actually shipping something. We can take years to build something with a beautiful and clever architecture and no technical debt, but it would be a misuse of our clients' budgets and time to do so. Likewise, we can sub-contract out to the cheapest off-shore bidders and ship something missing key features that crashes when you look at it funny.

We do believe it is possible to ship Good code in a reasonable amount of time, without gouging on price.

## Testing
This is our first line of defense. While it is possible to go overboard with testing zealotry, there is great value in _automated_ tests that run against your code. Tests fall into different categories. 

### Unit Tests
A unit test examines a single function or method (a single "unit"). For example, the tests for a function called `addIntegers` would make sure that the results of that function are the sum of the arguments passed in. These are the easiest to write, but also provide the least amount of utility. More bugs occur when the units meet, or to use the proper nomenclature, when they integrate with each other.

### Integration Tests
A proper unit test stubs out or mocks dependencies on the function. An integration test runs through 2 or more of those units and checks to see if the result is what was expected.

Because the tests depend on more pieces of code they tend to be harder to maintain. Integration tests usually don't go through the UI, though they may interact with the persistance layer. This requires a test environment to be running so that other environments don't get filled with test data.

### Full End to End Tests
To take it a step further, we can use something like [Selenium](http://www.seleniumhq.org) to perform actual UI tasks and then check the whole system to see if its state is what we expected. E2E tests can provide a significant amount of value, but are also the hardest to write and maintain. 

### Coverage
Utilities like [Istanbul](https://github.com/gotwarlost/istanbul) can tell you the percentage of your codebase that your automated tests hit. This is a useful statistic, but it is just that, a data point, and should not be chased just to hit an arbitrary metric. It is still possible to have bugs in a codebase that has 100% coverage.

### Testing Libraries
* React (including React Native)
	* [Jest](http://facebook.github.io/jest/)
* Angular
	* [Jasmine](https://jasmine.github.io) & [Karma](https://karma-runner.github.io/1.0/index.html) — The preferred combo as it comes with [Angular CLI](https://cli.angular.io)
	* [Mocha](https://mochajs.org) & [Chai](http://chaijs.com) — is a more generic test runner, but requires more manual work it integrate with Angular
* Node
	* Mocha & Chai
* iOS/Swift
	* [xctest](https://developer.apple.com/documentation/xctest) — There are other libraries to provide a more behavioral driven testing approach, but those are at the mercy of Xcode's tempermentalness.
	* [uitest](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html)
* Drupal
	* [BEHAT](https://www.drupal.org/project/drupalextension)
	* [phpunit](https://phpunit.de)

## QA?
TODO

## Continuous Integration
TODO

## Continuous Deployment
TODO
