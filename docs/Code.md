---
layout: default
title: "Tallwave Guidelines — Code"
---

[&larr; Home]({% if site.github.is_project_page %}/guidelines{% endif %}/)

# Code

## The lifeblood of development

There are many bad and good ways to write code. We aim for the latter.

## Your Editor

Use whatever you want, as long as it can follow [these guidelines and linting rules](https://github.com/tallwave/guidelines), it's fine. You may be gently teased if you use something too esoteric though.

### Git

This should come as no surprise, but git is vital to our workflow. On occasion we'll use other SCMs, but git is used in 99% of the projects. Most of the time this is managed through services such as GitHub, GitLab, or Bitbucket.

Depending on the needs of the project, repositories may be "owned" by us or the client. For certain engagements, such as project-based work, it makes sense for the repos to be in our organization, with changes pushed over to a client at specific intervals. Others, such as retainer-based work, benefit more from working in the cleint's organization.

#### GitHub & GitLab
GitHub has the best combination of features and usability, and is our primary git platform, though there are caveats.

[GitHub changed their business model a little while ago](https://github.com/blog/2164-introducing-unlimited-private-repositories). Organizations used to pay by the repository used, and the new model is to pay by the user, regardless of if that user is a full-fledged member or an "outside collaborator" on a single repo. If you create a lot of repositories in your organization and have only a few members, this plan is attractive, but that's usually the opposite of how our teams are set up. This means the cost of GitHub can quickly cross over $100/month, which is a little silly for a startup. It also introduces friction when deciding to add a Project Manager, Account Manager, or Beta Tester to the repository. $9/month is not a lot of money, but it still requires those conversations to take place, which though small, is still an interruption in work. We don't want to be in a place where someone even thinks of sharing their account with another person. 

[GitLab](https://gitlab.com/) is a common suggestion when considering Git providers. It isn't quite as user-friendly as GitHub, but for many use cases is [free](https://about.gitlab.com/gitlab-com/). In fact, we keep archived projects in there already. GitLab does have some features that GitHub does not as well, such as Continuous Integration pipelines that are worth digging into. 

However, GitHub has been focusing on improving their own tools. The Project boards in particular are incredibly effective at tracking how work gets done. GitLab's offering in this space isn't quite as compelling.

These days we have a luxury of choices when picking a git provider. The team is empowered to pick whichever one they feel is best for the project. GitHub is still the preferred provider, but others may be considered as well.

### Git Workflow

For reading through how to properly work in git as a team, [read this document]({% if site.github.is_project_page %}/guidelines{% endif %}/GitWorkflow).

#### Other Git Philosophies

* If it wasn't obvious, commit messages are important. Someone new to a project or a reviewer should be able to follow along to see how the project grew. **Consider** using an interactive rebase to squash certain commits to improve readability. This process is more of an art than a science, so rebase with care.
* Git's lifecycle allows us to use tools to help us improve our workflows. Use a library like [Husky](https://github.com/typicode/husky) to run tests before each push. (Husky can also run before each _commit_, but that is probably too interruptive).
* The git commandline is powerful, but not very user-friendly. Guis can help make advanced features more findable and are encouraged, so long as they don't introduce weird stuff into other developers' workflows.

### Code Review

Code reviews are necessary for [quality]({% if site.github.is_project_page %}/guidelines{% endif %}/Quality). Each Pull Request should be reviewed by someone. A proper code review can take time, and therefore work best when the PR in question isn't too long.

The reviewer should go through the code and ask the following questions:

 * Do I understand what this PR contains?
 * Is the intent clear?
 * Ask questions when necessary.
 * Be expedient, but not too expedient. This particular point can be difficult when work stacks up.
 * Check edge cases.
 * Add feedback when you are done.

In text the subtleties of spoken language can be misinterpreted, especially if the messages are terse. Let's be careful about what we say when talking about code because it is easy to fall into a trap and take critical feedback personally.

As a reviewer:

 * Address issues without using possessive language. "This code needs work" rather than "Your code needs work".
 * Point to previously agreed guidelines. "We agreed to avoid X"
 * If a requested change will take a long time to implement consider moving it to a separate refactor ticket.
 * Be direct and to the point. Reviews are valuable, but so is time to respond and correct.
 * Assume good intent.

As a reviewee:

 * Do not take criticism personally. You are not your code :)
 * Be open to improvement/suggestion.
 * Defend your position with proof if you feel it necessary.
 * Assume good intent.

Everyone:

 * We like emoji. And GIFs.
 * Tread lightly with sarcasm and humor. It is very easy to misinterpret those.
 * Be timely.
 * Assume good intent.

Above all, remember that the goal should always be to ship quality code.

It should be noted that in a codebase where things like PCI or HIPAA compliance are necessary, additional requirements must be met, but that can be discussed elsewhere.
