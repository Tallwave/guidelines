# Code

## The lifeblood of development

There are many bad and good ways to write code. We aim for the latter. 

### Git

This should come as no surprise, but git is vital to our workflow. On occasion we'll use other SCMs, but git is used in 99% of the projects. Most of the time this is managed through services such as GitHub, Gitlab, or Bitbucket.

#### Workflow

We follow a ["fork and pull-request"](https://guides.github.com/introduction/flow/) model of software development. At a high level that means that everyone should fork the main repository to their own version. This allows each developer to have their own sandbox to play in without worrying of screwing things up for anyone else. It also means that if you do break everything completely, you can delete it all and fork it again.

Here's how it works:

1. Fork the main or `upstream` repository. Now you have your own version of the repository. This is your `orign` repo.
2. Clone it to your local machine.
3. Create branches for features and bugfixes. These should be intelligently named. `spline-reticulator` or `issue-23-fix-data-deletion` are good. `fixes` is bad.
4. Commit early and often. Commit messages should also be intelligent and describe what changed. It is recommended taking the present tense with commit messages, so that it completes this sentence: "This commit...".
5. Push the commits to that branch on `origin` (remember this is your fork)
6. When ready, create a Pull Request (or Merge Request on Gitlab). This should have a good title and descriptive message.
7. The developer should assign another developer (or more) to review the PR.
8. Reviewers can comment on code, request changes, or approve it.
9. Once approved, the PR can be merged into the `master` branch.