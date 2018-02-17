---
layout: default
title: "Tallwave Guidelines — QA"
---

[&larr; Home]({{ site.root }}/) &mdash; [Quality]({{ site.root }}/Quality)

# QA
QA can take different forms. At the most basic level, a QA team can perform manual testing. This involves writing manual scripts, executing them, and then filing bugs when issues are encountered while executing those scripts. Manual testing is time consuming, and is still prone to human error.

A QA team can also write automated tests, even down to the unit level. However, developers tend to be best suited for unit and most integration testing, since those benefit from a deeper understanding of what will be written. A QA Engineer is well suited for writing and maintaining end-to-end tests though, since those focus on whether acceptance criteria have been satisified or not.

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
Bugs should be treated similarly to issues and scheduled as a part of Sprint grooming and planning. Showstoppers and certain Major issues will likely require immediate attention. All other severities should be mixed in with stories and scheduled appropriately.

### Agile Manual QA Overflow
Developing automated integration or UI tests are time consuming. It's hard to maintain automation tests while a feature is being developed. And often, having enough time to create UI and integration tests while developing is a luxury we don't get. Even though your development process might include TDD, unit tests won't catch the bugs that occur due to integration. So, to continue to maintain high quality, manual QA becomes necessary until the feature settles down.

To minimize human error, but maximize time to release, the best approach is to develop a Manual QA Document, or script, that captures items that should be tested before a release. These items should include both the normal vectors, and also corner case vectors of the application. This document should be updated regularly as more corner cases appear, bugs are found and squashed, and features are changed.

Once there is time, and churn on a feature ends, the items from the manual QA document should be converted to either integration or UI automation tests. This creates an *overflow* process, like the coolant overflow tank in a car. As you develop, and things are hot, new tests should "overflow" to the manual QA document. Then, once development has cooled off, items should be removed from the manual QA document and converted to Unit or UI Automation tests.

The manual QA script is only useful if there's a process to go through manual QA before releasing the product.
