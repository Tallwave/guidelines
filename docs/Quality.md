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

#### Criteria for useful unit tests
1. Will it *really* catch any bugs?
2. Will it prevent developers from injecting new bugs?
3. Will it strengthen unavoidable brittle code?
4. Will it help maintain unavoidable complex algorithms?
5. Will it test real corner cases?
  - A real corner case is when there's a greater-than-zero chance of something occurring in the field
- An unreal corner case is execution of the default of a switch statement that will never occur unless a solar flare flips a bit on a physical register
6. For weakly typed languages, will it help maintain correct type usage?

The following are helpful, but can have short expiration dates, and quickly become a hindrance to development. This is a gray area, should be taken on a case-by-case basis, and healthy debate is encouraged.
1. Will it help catch errors when you refactor?
2. Will it help you during development (TDD)? Will it get from point A to Z? Will it help highlight any holes in your logic?
These tests capture the *normal* set of acceptance criteria, versus the corner cases. It's also an area where the most development churn occurs. Maintaining these tests adds double duty to the developer, and whatever these unit tests capture, has already been easily captured by normal use of the application. So the cost can outweigh the benefit by a large margin. It can be argued that these tests should be removed, or disabled, so that it doesn't slow down development.

#### Indicators of useless, or toxic, unit tests
1. Is the test brittle and prone to show false-negatives?
2. Is it testing the language. For example, is it testing whether a switch statement is working?
3. Is it testing an already vetted, well used, library or function? Example, testing the sqrt() function in the math.lib
4. Does the cost of maintaining the unit test far outweigh the benefits of keeping the test around?

#### Examples of good unit tests
1. Test to maintain complex algorithms that calculates the recommendation of contacts that could be your family. It ensures that any changes to the algorithm, which affect expected recommendation results, causes the test to fail. The test was useful during TDD, to get from a list of contacts (point A) to the expected recommendations (point Z). The test also helped post-production, where each corner case found on the field had a new test to future-proof against regression.
2. Test to verify whether Google's phone number library detects the right countries when given numbers of various formats. The unit test was able to detect which formats and countries will result in mismatches, these were documented in the unit test. The list of phone numbers were also updated as corner cases were found post-production.
3. Test to populate the properties of models with correct values to display in charts and diagrams. The tests help maintain unavoidable brittle, and complex, functions that manipulate various inputs to produce specific models.
4. Test to make sure that calculating streaks works in different time zones, leap years, and edge cases like near the end of the month or year.

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

## QA?
TODO

## Continuous Integration
TODO

## Continuous Deployment
TODO
