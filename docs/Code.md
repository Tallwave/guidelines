---
title: "Tallwave Guidelines — Code"
---

[&larr; Home](/guidelines)

# Code

## The lifeblood of development

There are many bad and good ways to write code. We aim for the latter. 

### Git

This should come as no surprise, but git is vital to our workflow. On occasion we'll use other SCMs, but git is used in 99% of the projects. Most of the time this is managed through services such as GitHub, Gitlab, or Bitbucket.

#### Workflow

We follow a ["fork and pull-request"](https://guides.github.com/introduction/flow/) model of software development. At a high level that means that everyone should fork the main repository to their own version. This allows each developer to have their own sandbox to play in without worrying of screwing things up for anyone else. It also means that if you do break everything completely, you can delete it all and fork it again.

Here's how it works:

1. Fork the main or `upstream` repository. Now you have your own version of the repository. This is your `origin` repo.

Let's interrupt real quick and talk naming. The convention here is that the `master` branch on `upstream` is what will be deployed at some point. That means that it needs to be in proper working order. Do not commit directly to `master` and do not push directly to `upstream`. Do your branching on your own fork (`origin`) in order to keep `upstream` clean. 

<ol start="2">
<li>Clone it to your local machine.</li>
<li>Create branches for features and bugfixes. These should be intelligently named. `spline-reticulator` or `issue-23-fix-data-deletion` are good. `fixes` is bad.</li>
<li>Commit early and often. Commit messages should also be intelligent and describe what changed. It is recommended taking the present tense with commit messages, so that it completes this sentence: "This commit...".</li>
<li>Push the commits to that branch on `origin` (remember this is your fork)</li>
<li>When ready, create a Pull Request (or Merge Request on Gitlab). This should have a good title and descriptive message.</li>
<li>The developer should assign another developer (or more) to review the PR.</li>
<li>Reviewers can comment on code, request changes, or approve it.</li>
<li>Once approved, the PR can be merged into the `master` branch.</li>
<li>Others can then pull from `upstream` to get the most up to date code.</li>
</ol>

You'll be doing `git pull upstream master` a lot in order to stay up to date. Frequent smaller commits also helps avoid conflicts.

