---
title: "Tallwave Guidelines — Code"
---

[&larr; Home](/guidelines)

# Code

## The lifeblood of development

There are many bad and good ways to write code. We aim for the latter.

## Your Editor

Use whatever you want, as long as it can follow our [guidelines and linting rules](https://github.com/tallwave/guidelines), it's fine. You may be gently teased if you use something esoteric though.

### Git

This should come as no surprise, but git is vital to our workflow. On occasion we'll use other SCMs, but git is used in 99% of the projects. Most of the time this is managed through services such as GitHub, Gitlab, or Bitbucket.

We strongly recommend that our clients own and maintain the SCM themselves, this leaves no room for doubt over who owns the code and the project.

#### GitHub & GitLab
GitHub has the best combination of features and usability, and is our primary git platform, though there are caveats.

[GitHub changed their business model a little while ago](https://github.com/blog/2164-introducing-unlimited-private-repositories). Organizations used to pay by the repository used, and the new model is to pay by the user, regardless of if that user is a full-fledged member or an "outside collaborator" on a single repo. If you create a lot of repositories in your organization and have only a few members, this plan is attractive, but that's usually the opposite of how our teams are set up. This means the cost of GitHub can quickly cross over $100/month, which is a little silly for a startup. It also introduces friction when deciding to add a Project Manager, Account Manager, or Beta Tester to the repository. $9/month is not a lot of money, but it still requires those conversations to take place, which though small, is still an interruption in work.

All that is to say that because of those constraints we are evaluating using [GitLab](https://gitlab.com/) for client work. GitLab isn't quite as user-friendly, but for many use cases is [free](https://about.gitlab.com/gitlab-com/). In fact, we keep archived projects in there already. GitLab does have some features that GitHub does not as well, such as Continuous Integration pipelines that are worth digging into.

### Git Workflow

We follow a ["fork and pull-request"](https://guides.github.com/introduction/flow/) model of software development. At a high level that means that everyone should fork the main repository and have their own version. This allows each developer to have a sandbox to play in without worrying of screwing things up for anyone else. It also means that if you do break everything completely, you can delete it all and fork it again.

Here's how it works:

1. Fork the main or `upstream` repository. Now you have your own version of the repository. This is your `origin` repo.

<img src="/guidelines/assets/images/code/code-fork.png" alt="fork a repo" />

Let's interrupt real quick and talk naming. The convention here is that the `master` branch on `upstream` is what will be deployed at some point. That means that it needs to be in proper working order. Do not commit directly to `master` and do not push directly to `upstream`. Do your branching on your own fork (`origin`) in order to keep `upstream` clean.

<ol start="2">
<li>Clone it to your local machine.</li>
</ol>

<img src="/guidelines/assets/images/code/code-clone.png" alt="clone a repo locally" />

<ol start="3">
<li>Create branches for features and bugfixes. These should be intelligently named. <code class="highlighter-rouge">spline-reticulator</code> or <code class="highlighter-rouge">issue-23-fix-data-deletion</code> are good. <code class="highlighter-rouge">fixes</code> is bad.</li>
</ol>

<img src="/guidelines/assets/images/code/code-branch.png" alt="create branches locally" />

<ol start="4">
<li>Commit early and often. Commit messages should also be intelligent and describe what changed. It is recommended taking the present tense with commit messages, so that it completes this sentence: "This commit...".</li>
<li>Push the commits to that branch on <code class="highlighter-rouge">origin</code> (remember this is your fork)</li>
</ol>

<img src="/guidelines/assets/images/code/code-push.png" alt="push changes to origin" />

<ol start="6">
<li>When ready, create a Pull Request (or Merge Request on Gitlab). This should have a good title and descriptive message.</li>
</ol>

<img src="/guidelines/assets/images/code/code-pr.png" alt="create a pull request" />

<ol start="7">
<li>The developer should assign another developer (or more) to review the PR.</li>
<li>Reviewers can comment on code, request changes, or approve the PR.</li>
<li>Once approved, the PR can be merged into the <code class="highlighter-rouge">master</code> branch.</li>
<li>Others can then pull from <code class="highlighter-rouge">upstream</code> to get the most up to date code.</li>
</ol>

<img src="/guidelines/assets/images/code/code-pull.png" alt="pull down changes" />

You'll be doing `git pull upstream master` a lot in order to stay up to date. Frequent smaller commits also helps avoid conflicts.

#### Other Git Philosophies

* If it wasn't obvious, commit messages are important. Someone new to a project or a reviewer should be able to follow along to see how the project grew. **Consider** using an interactive rebase to squash certain commits to improve readability. This process is more of an art than a science, so rebase with care.
* Git's lifecycle allows us to use tools to help us improve our workflows. Use a library like [Husky](https://github.com/typicode/husky) to run tests before each push. (Husky can also run before each _commit_, but that is probably too interruptive).
* The git commandline is powerful, but not very user-friendly. Guis can help make advanced features more findable and are encouraged, so long as they don't introduce weird stuff into other developers' workflows.

### Code Review

Code reviews are necessary for quality. Each Pull Request should be reviewed by someone. A proper code review can take time, and therefore work best when the PR in question isn't too long.

The reviewer should go through the code and ask the following questions:

 * Do I understand what this PR contains?
 * Is the intent clear?
 * Ask questions when necessary.
 * Be expedient, but not too expedient. This particular point can be difficult when work stacks up.
 * Check edge cases.
 * Add feedback when you are done.

In text the subtleties of language can be missed, especially in the terse dialogs of review comments. Neither developer should assume ill intent during code reviews. The goal should always be to ship quality code, not grind axes.

 It should be noted that in a codebase where things like PCI or HIPAA compliance are necessary, additional requirements must be met, but that can be discussed elsewhere.
