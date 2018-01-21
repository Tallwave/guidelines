---
layout: default
title: "Tallwave Guidelines — Quality"
---

[&larr; Home]({{ site.root }}/)

# Quality

# Readme's
[README's](https://en.wikipedia.org/wiki/README) are the entry point to a project or code base. As such, they should be continuously updated as important information about the project and code base evolves and/or changes. In essence, a README is the instruction manual on how to get the content of a repository to do what it's intended to do.

There are many examples of really good README's and even the [intro to GitHub](https://guides.github.com/activities/hello-world/) can be considered to be a README. There are also many examples of realy bad README's, including those that may be extensive but don't have the outcome originally intended.

## Content Guidelines
README's are there to give a description of the project, how to set it up, how to install it and how to get it to run.
While the specifics of what should and should not be included in the document depend on the project or contents of the repository, the following informatioon should be imparted:

##Recommended Structure
The table of contents for a README should contain at least the following:
> * **Title**
> * **Description**
> * **Tech Stack**
> * **Quick Start**
> * **Plugins**
> * **Project Structure**
> * **Database(s)**
> * **License**
> * **Contributors**

**Title**: The title of the project/module/plugin is short but as decriptive and relevant as possible. 

**Description**: More verbose introduction to the project and contents of the code.

**Tech Stack**: A list of technologies used, for example:

1. Node, 
2. React, 
3. Mongo, 
4. AWS (or any external dependencies) etc.
 
At a glance, the reader should get a general feel for what is needed to run the code.

**Quick start guide**: Developers tend to be impatient and, as such, really value this section! After walking through each step (often written as an ordered list), the user should get the code running locally. Often, code snippets are provided for copy-paste options. The level of detail in this section depends on the complexity of the app/code base but at a minimum should include the following:

1. Instructions on how to fork, clone and install the code.
2. How to run tests.
3. How to start the app.

**Plugins**: Please give a brief description of the plugins used (if possible) and any issues that are know to be problematic
 - Links to the original repos &/or npm docs are useful.

**Project Structure**: This section provides a brief overview of the folder and file structure and any conventions that should be followed. As an example, in a react-redux web app, folders and files are sometimes grouped together under the containers/components/redux convention or could follow the feature based convention where all the files related to a specific feature are grouped under a feature folder.

**Database(s)**: Description of the database(s) used (Relational/non-relational etc), the set-up instructions, tooling and GUI's that can/should be used.

**License**: (Optional)

**Contributors**: Contact information for code contributors if possible.