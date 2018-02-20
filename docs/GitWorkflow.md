---
layout: default
title: "Tallwave Guidelines — Git Workflow"
---

[&larr; Home]({{ site.root }}/) &mdash; [Code]({{ site.root }}/Code)

# Git Workflow

We follow a ["fork and pull-request"](https://guides.github.com/introduction/flow/) model of software development. At a high level that means that everyone should fork the main repository and have their own version. This allows each developer to have a sandbox to play in without worrying of screwing things up for anyone else. It also means that if you do break everything completely, you can delete it all and fork it again.

Here's how it works:

1. Fork the main or `upstream` repository. Now you have your own version of the repository. This is your `origin` repo.

<img src="{% if site.github.is_project_page %}/guidelines{% endif %}/assets/images/code/code-fork.png" alt="fork a repo" />

Let's interrupt real quick and talk naming. The convention here is that the `master` branch on `upstream` is what will be deployed at some point. That means that it needs to be in proper working order. Do not commit directly to `master` and do not push directly to `upstream`. Do your branching on your own fork (`origin`) in order to keep `upstream` clean.

<ol start="2">
<li>Clone it to your local machine.</li>
</ol>

<img src="{% if site.github.is_project_page %}/guidelines{% endif %}/assets/images/code/code-clone.png" alt="clone a repo locally" />

<ol start="3">
<li>Create branches for features and bugfixes. These should be intelligently named and end with the issue number, preceeded by a hash (#). <code class="highlighter-rouge">spline-reticulator-#11</code> or <code class="highlighter-rouge">fix-data-deletion-#23</code> are good. <code class="highlighter-rouge">fixes</code> is bad.</li>
</ol>

<img src="{% if site.github.is_project_page %}/guidelines{% endif %}/assets/images/code/code-branch.png" alt="create branches locally" />

<ol start="4">
<li>Commit early and often. Commit messages should also be intelligent and describe what changed. It is recommended taking the present tense with commit messages, so that it completes this sentence: "This commit...".</li>
<li>Push the commits to that branch on <code class="highlighter-rouge">origin</code> (remember this is your fork)</li>
</ol>

<img src="{% if site.github.is_project_page %}/guidelines{% endif %}/assets/images/code/code-push.png" alt="push changes to origin" />

<ol start="6">
<li>When ready, create a Pull Request (or Merge Request on Gitlab). This should have a good title and descriptive message.</li>
</ol>

<img src="{% if site.github.is_project_page %}/guidelines{% endif %}/assets/images/code/code-pr.png" alt="create a pull request" />

<ol start="7">
<li>The developer should assign another developer (or more) to review the PR.</li>
<li>Reviewers can comment on code, request changes, or approve the PR.</li>
<li>Once approved, the PR can be merged into the <code class="highlighter-rouge">master</code> branch.</li>
<li>Others can then pull from <code class="highlighter-rouge">upstream</code> to get the most up to date code.</li>
</ol>

<img src="{% if site.github.is_project_page %}/guidelines{% endif %}/assets/images/code/code-pull.png" alt="pull down changes" />

You'll be doing `git pull upstream master` a lot in order to stay up to date. Frequent smaller commits also helps avoid conflicts.

