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
A unit test examines a single function or method (a single "unit"). For example, the tests for a function called `addIntegers` would make sure that the results of that function are the sum of the arguments passed in. These are the easiest to write, but also provide the least amount of utility because units of code never run in isolation. More bugs occur when the units meet, or to use the proper nomenclature, when they integrate with one another.

### Integration Tests
A proper unit test stubs out or mocks dependencies on a single function. An integration test runs through 2 or more of those units and then verifies the result.

Because the tests depend on more pieces of code they tend to be more difficult to maintain. Integration tests usually don't go through the UI, though they may interact with the persistance layer. This requires a test environment to be running so that other environments aren't polluted with test data.

### Full End to End Tests
To take it a step further, we can use a platform like [Selenium](http://www.seleniumhq.org) to perform actual UI tasks and then check validate the UI, database, and various points in between for correctness. E2E tests can provide a significant amount of value, but are also the most difficult and time consuming to write and maintain. 

### Coverage
Utilities like [Istanbul](https://github.com/gotwarlost/istanbul) provide the percentage of your codebase that your automated tests hit. This is a useful statistic, but it is just that, a data point, and should not be chased just to hit an arbitrary metric. It is still possible to have bugs in a codebase that has 100% coverage.

### Testing Libraries
* React (including React Native)
	* [Jest](http://facebook.github.io/jest/)
	* [Enzyme](http://airbnb.io/enzyme/) — is an alternative if Jest is not available.
* Angular
	* [Jasmine](https://jasmine.github.io) & [Karma](https://karma-runner.github.io/1.0/index.html) — The preferred combo as it comes with [Angular CLI](https://cli.angular.io)
	* [Mocha](https://mochajs.org) & [Chai](http://chaijs.com) — is a more generic test runner, but requires more manual work to integrate with Angular
* Node
	* Mocha & Chai
* iOS/Swift
	* [xctest](https://developer.apple.com/documentation/xctest) — There are other libraries that provide a more behavioral driven testing approach, but those are at the mercy of Xcode's tempermentalness.
	* [uitest](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html)
* Drupal
	* [BEHAT](https://www.drupal.org/project/drupalextension)
	* [phpunit](https://phpunit.de)

## QA
QA can take different forms. At the most basic level, a QA team can perform manual testing. This involves writing manual scripts, executing them, and then filing bugs when issues are encountered while executing those scripts. Manual testing is time consuming, and is still prone to human error.

A QA team can also write automated tests, even down to the unit level. However, developers tend to be best suited for unit and most integration testing, since those benefit from a deeper understanding of what will be written. A QA Engineer is well suited for writing and maintaining end-to-end tests though, since those focus on whether acceptance criteria has been satisified or not.

QA is most effective when that team is a part of the full development life-cycle. There is some benefit bringing them in at the end of the process to execute manual testing against a product gearing up for a release, but that is less effective than baking QA in throughout the whole engagement. 

### A Good Bug Report
There are good bug reports, and then there are bad ones. Good ones provide the developer all of the information needed to dive in and fix the bug. Sometimes it is not possible to find all of the nitty gritty details, such as with an intermittently occurring bug, but any detail beyond "the app is broke" goes a long way.

Good details in a bug report include:

* A description of what is happening.
* What is expected to happen.
* What is actually happening.
* Steps to reproduce the issue.
* How reproducible the issue is.
* Severity
  * Showstopper (this breaks major pieces of functionality)
  * Major (a big problem, but not a critical fix)
  * Minor (affects a smaller piece functionality)
  * Trivial (eg. a copy error)

### Bug Triage
Bugs should be treated similarly as issues and scheduled as a part of Sprint grooming and planning. Showstoppers and certain Major issues will likely require immediate attention. All other severities should be mixed in with stories and scheduled appropriately.

## Continuous Integration
When multiple developers are working on a codebase, Continuous Integration becomes an important process to keep tests successfully passing. When code is checked into the Source Control Management system, the test suite should run before that code is merged into the master branch. If the results of that suite do not pass with 100%, the code should not be merged in.

This process can happen automatically with [GitLab's CI pipelines](https://docs.gitlab.com/ee/ci/).

## Continuous Deployment
TODO
