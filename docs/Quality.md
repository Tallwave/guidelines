---
layout: default
title: "Tallwave Guidelines — Quality"
---

[&larr; Home]({{ site.root }}/)

# Quality
There is a delicate balance between doing great work and actually shipping something. We can take years to build something with a beautiful and clever architecture and no technical debt, but it would be a misuse of our clients' budgets and time to do so. Likewise, we can sub-contract out to the cheapest off-shore bidders and ship something missing key features that crashes when you look at it funny.

We do believe it is possible to ship Good code in a reasonable amount of time, without gouging on price.

## Testing
This is our first line of defense. While it is possible to go overboard with testing zealotry, there is great value in _automated_ tests that run against your code. These kinds of tests fall into different categories.

### Unit Tests
A unit test examines a single function or method (eg. a single "unit"). For example, the tests for a function called `addIntegers` would make sure that the results of that function are the sum of the arguments passed in. These are the easiest to write, but also provide the least amount of utility because units of code never run in isolation. More bugs occur when the units meet, or to use the proper nomenclature, when they **integrate** with one another.

#### Criteria for useful unit tests
1. Will it *really* catch any bugs?
2. Will it prevent developers from injecting new bugs?
3. Will it strengthen unavoidably brittle code?
4. Will it help maintain unavoidably complex algorithms?
5. Will it test corner cases?
  - A realistic corner case is when there's a greater-than-zero chance of something occurring in the field.
	- An example of an unrealistic corner case is checking the execution of the default of a switch statement that will never occur unless a solar flare flips a bit on a physical register.
6. For weakly typed languages, will it help maintain correct type usage?

The following are helpful, but can have short expiration dates, and quickly become a hindrance to development. This is a gray area, should be taken on a case-by-case basis, and healthy debate around if and when to remove them is encouraged.
1. Will it help catch errors when you refactor?
2. Will it help you during development (TDD)? Will it get from point A to Z? Will it help highlight any holes in your logic?
These tests capture the *normal* set of acceptance criteria, versus the corner cases. It's also an area where the most development churn occurs. Maintaining these tests adds double duty to the developer, and whatever these unit tests capture, has already been easily captured by normal use of the application. So the cost can outweigh the benefit by a large margin. It can be argued that these tests should be disabled so that it doesn't slow down development.

#### Indicators of useless, or toxic, unit tests
1. Is the test brittle and prone to show false-negatives?
2. Is it testing the language? For example, is it testing whether a switch statement is working?
3. Is it testing an already vetted, well used, library or function? Example, testing the `sqrt()` function in the math.lib
4. Does the cost of maintaining the unit test far outweigh the benefits of keeping the test around?
5. Does a test depend on another test being executed before it? If it does, then you aren't writing a unit test. Unit tests need to operate independently from each other.

#### Examples of good unit tests
1. A test that verifies that a deterministic algorithm remains deterministic, meaning, does it always return the same results given the same input. In other words, does it remain [idempotent](https://en.wikipedia.org/wiki/Idempotence)? 
2. A test to check whether a function handles null inputs properly, if allowed.
4. A test to make sure that calculating streaks works in different time zones, leap years, and edge cases like near the end of the month or year.

### Integration Tests
A proper unit test stubs out or mocks dependencies on a single function. An integration test runs through 2 or more of those units and then verifies the result.

Because the tests depend on more pieces of code they tend to be more difficult to maintain. Integration tests usually don't go through the UI, though they may interact with the persistance layer. This requires a test environment to be running so that other environments aren't polluted with test data.

### Full End to End Tests
To take it a step further, we can use a platform like [Selenium](http://www.seleniumhq.org) or [Cypress](https://www.cypress.io/) to perform actual UI tasks and then validate the UI, database, and various points in between for correctness. E2E tests can provide a significant amount of value, but are also the most difficult and time consuming to write and maintain.

### Coverage
Utilities like [Istanbul](https://github.com/gotwarlost/istanbul) provide the percentage of your codebase that your automated tests hit. This is a useful statistic, but it is just that, a data point, and should not be chased just to hit an arbitrary metric. It is still possible to have bugs in a codebase that has 100% coverage.

### Testing Libraries
* React (including React Native)
	* [Jest](http://facebook.github.io/jest/)
	* [Enzyme](http://airbnb.io/enzyme/) — is an alternative if Jest is not available.
* Angular
	* [Jasmine](https://jasmine.github.io) & [Karma](https://karma-runner.github.io/1.0/index.html) — The preferred combo as it comes with [Angular CLI](https://cli.angular.io).
	* [Mocha](https://mochajs.org) & [Chai](http://chaijs.com) — is a more generic test runner, but requires more manual work to integrate with Angular.
* Node
	* Mocha & Chai
* iOS/Swift
	* [xctest](https://developer.apple.com/documentation/xctest) — There are other libraries that provide a more behavioral driven testing approach, but those are at the mercy of Xcode's tempermentalness.
	* [uitest](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html)
* Drupal
	* [BEHAT](https://www.drupal.org/project/drupalextension)
	* [phpunit](https://phpunit.de)

## QA
[QA is a longer subject and deserves its own page]({% if site.github.is_project_page %}/guidelines{% endif %}/QA).

## Release
A good release process is essential in maintaining quality. It's important to consider:
- What is going into a release?
- Has it been tested before releasing?
- What happens if a previous release needs to be patched?
- What versions of software components integrate with each other?
- How to back out if things go sideways?

### Software Integration
Software rarely comes in singles. There is usually a client side application that pairs with server side code. If done well, the server code should remain backwards compatible. Meaning, any updates to the server should continue to maintain previous versions of client application that users haven't updated yet.

It's still a good idea to capture and release software in groups. Especially when you have multiple types of client software, such as a dashboard that pairs with a client application, and they both share the same server backend.

The best approach is to add **git tags** with [Semantic Versioning](https://semver.org/) to each of the software components being integrated. [Git Tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging) will make it easy for developers to roll back to the exact software for that version. If using GitHub, they have a feature called [Releases](https://help.github.com/articles/creating-releases/) that rely on git tags, but offer more meta data to include helpful information, such as whether it's a `pre-release` or a `publish release`.

These tags, and the version numbers, should be documented in an Integration Document. Each software component will have its own version, and the group of software that integrates together will have a **Named Version**. The named versions can be creative, like [Apple's use of California locations](https://techcrunch.com/2013/06/10/os-x-mavericks/). Don't go crazy with names. Major releases can be named, point releases shouldn't to avoid confusion.

Here's an example of a table to keep track of software integrations:

| Named Release | Dashboard | iOS App | Server |
|---------------|-----------|---------|--------|
| Chimpanzee    | 1.0.14    | 1.1.3   | 1.0.0  |
| Orangutan     | 1.1.6     | 1.2.8   | 1.1.5  |

#### Living Documents
Documents such as a Manual QA script, or the table to keep track of software integration versions should live in locations that are:
- Easily accessible for developers as well as product managers
- Easily editable. 

A Google doc, or the company wiki works well. Something like markdown pages on GitHub might work, but there is overhead in editing the document, and usually repos aren't public enough to easily share among all the parties that might want it.

### Patching Releases
Development never stops, and software is never perfect. Often, by the time a bug is found on a released software, develpment has already added hundreds of commits on the master branch. This is when the power of **git tags** shine.
1. Create a patch release branch off the tag of the release that needs to be fixed. Name it something like: `patch-1.1.6` (where `1.1.6` is a new version from the released version of `1.1.5`)
2. Create a Pull Request to merge the fix onto this patch release branch.
3. Once merged, create a new Pull Request to implement the same fix on the master branch. Or cherry-pick it directly onto the master branch. This will ensure that the next major release will have this fix already integrated.
4. Keep the patch release branch around. You can create a new tag, but this tag won't be helpful. Tags are associated with a commit. So when rolling back to a tag, it necessarily won't have the same git chain as the patch release branch, especially when cherry-picking the commit from the patch branch to on top of the master branch.
5. Create a new entry in the software integration document:

| Named Release | Dashboard | iOS App | Server |
|---------------|-----------|---------|--------|
| Chimpanzee    | 1.0.14    | 1.1.3   | 1.0.0  |
| Orangutan     | 1.1.6     | 1.2.8   | 1.1.5  |
| Orangutan2    | 1.1.6     | 1.2.8   | 1.1.6  |

### Continuous Integration
When multiple developers are working on a codebase, Continuous Integration (CI) becomes an important process to keep tests successfully passing. When code is checked into the Source Control Management system, the test suite should run before that code is merged into the master branch. If the results of that suite do not pass with 100%, the code should not be merged in.

Options for CI include [CircleCI](https://circleci.com), [Travis](https://travis-ci.org), and [GitLab](https://docs.gitlab.com/ee/ci/).
