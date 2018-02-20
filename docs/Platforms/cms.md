---
layout: default
title: "Tallwave Guidelines — Platforms — Content Websites"
---

[&larr; Home]({{ site.root }}/) &mdash; [Platforms]({{ site.root }}/platforms)

# Content Based Websites

On today's Internet, content is king. Being the top result on a search engine (Google) provides a significant advantage in the marketplace. [Bill Gates allegedly](https://www.craigbailey.net/content-is-king-by-bill-gates/) said in 1996 "Content is where I expect much of the real money will be made on the Internet, just as it was in broadcasting."

In that essay he goes on to say how it's not just about putting content on the Internet. Rather, it's about *relevant* and *innovative* content. This can take the form of something as small as a single landing page, or a massive content platform serving hundreds, or thousands of pages.

## Marketing Websites

A good marketing website can do so many things for our clients. It's the first thing their customers see so it:

 * Gives the first impression of brand, UX, and product.
 * If done properly, moves customers through the sales pipeline.
 * Serves as a portal to other products we may have built.
 * Demonstrates our abilities at web design and development.
 * Provides the customer with analytics and marketing knowledge.

A marketing site by its nature will have fewer moving parts than a full-fledged application. Its purpose is more to present information to guide the user through a specific funnel rather than to allow them to explore every piece of content on the site. Thus, these websites do not involve heavy duty frameworks like React or Angular. We do tend to favor building these on WordPress, or plain HTML and CSS files. These are typically built using different libraries, frameworks, pre-processors, package managers, and toolkits:

 * [Bootstrap 4](https://v4-alpha.getbootstrap.com/) A CSS framework which can can be easily installed via [Node.js](https://nodejs.org/en/) and [npm](https://www.npmjs.com/).
 * [Foundation](http://foundation.zurb.com/sites/docs/) (6.4.0/latest version) Another excellent framework for web sites/non single-page apps because of its [Gulp](http://gulpjs.com/) and npm integration, ease-of-use and features. One benefit over Bootstrap is a gulpfile.js is already generated for you, so a Gulp recipe doesn't have to be made from scratch.
 * [Jekyll](https://jekyllrb.com/): Generates plain HTML and CSS and is useful if no database is required. It's also used to quickly prototype in conjunction with Bootstrap or Foundation frameworks. Tallwave has a a front-end build tool called [Quench](https://github.com/Tallwave/quench) to quickly spin up static web sites using Gulp, Jekyll, Sass and Bootstrap or Foundation.

## Content Management Systems

Our clients should be able to manage and publish their content with ease. This means that any workflow to manage their content needs to be flexible for their system, and not force them into a foreign paradigm.

Modern Content Management Systems have solved this problem. And like any other trending technologies there is a lot of noise, and everyone seems to have an opinion on which platform to use and how to implement it. Here at Tallwave, we focus on two: **Drupal** and **WordPress**, mainly because of the size of the community that represents them. A large community means that the platforms are constantly being updated and vetted for security issues. Platforms that are continuously updated mean they are constantly evolving and progressing to become better at solving the problems they are built to solve.

### WordPress

People often make the mistake of classifying WordPress as just a blogging platform. Although that is a big part of its origin story, WordPress has evolved through the years into a versatile CMS. While you can still use WordPress to create a simple blog, it allows for fully functional websites and mobile applications to live on top of it.

WordPress's greatest asset is that it’s easy to use and flexible enough for most kinds of content; it can be included into nearly every kind of system and environment. Another key point is that it has a permissive open source license, meaning that there is no cost to purchase the software itself. 

We can implement WordPress websites or develop custom plugins and themes for our clients. Since the market for WordPress themes and plugins is so massive, many are of poor quality and should not be used. Part of our expertise is in selecting the proper set of libraries, or building them, for our clients to use. 

#### Recommended Service Providers

WordPress can be hosted on a client's own infrastructure, however we recommend using a hosting provider in order to simplify the management process. Both of these platforms will provide many additional features, such as multiple environments, at a modest cost:

* [Pantheon](https://pantheon.io/)
* [WPEngine](https://wpengine.com/)

WordPress works great for for content heavy websites and landing pages. WordPress starts to show its weaknesses when there are needs beyond straightforward content management and heavy integrations. When our clients have a more demanding and complex needs, Drupal becomes our platform of choice.

### Drupal
Drupal is a progressive content platform that was built with customization in mind. At a high level, Drupal is a collection of modules and components that interact with each other. These modules have hooks that allow developers to modify internal pieces without requiring a full overhaul of the module. This allows Drupal to be a business solution and not just a website builder.

This componentized nature also applies to the information architecture of a Drupal site itself. Drupal can adjust to the level of detail that your theme requires. A theme can be written from the ground up, or extended from an off-the-shelf theme.

Performance can be tuned at multiple entrypoints of the page-render lifecycle. There is caching built-in out of the box as well as support for multiple layers of caching throughout the request. This allows for a fine control over exactly what is cached on a page and how.

Scalability also benefits from the componentized architecture. Because of Drupal's modularity you can scale the individual pieces of the installation to suit the needs of a particular project.

One of the biggest differentiators for Drupal is that it has robust content authoring workflows out of the box. And, as expected, those can be customized to suit different needs. For example, an author can create multiple revisions of a single piece content, hand those over to an editor who makes additional updates, which are then approved by a stake holder, and finally, published on the site. Notifications are built-in so that each person along the chain is immediately aware of the state the content is in.

Drupal creates a RESTful API for the content it stores. This means that any other application, library, or technology that can consume a RESTful API can then be used to render or manage the content. One of the most common scenarios for this is having one development team work in parallel with another to develop the front and back ends of a project simultaneously.

Drupal is built on top of the [Symfony](scalability) framework, which was created with security as key priority. Any modules included in the core installation are heavily scrutinized. [Drupal's security](https://www.drupal.org/documentation/is-drupal-secure) is maintained by a team of developers that review and fix [Critical Vulnerability Exceptions](https://www.cvedetails.com/vulnerability-list/vendor_id-1367/product_id-2387/Drupal-Drupal.html) as they come in. They publish detailed reports for each issue and how they were patched.

Many CMSes support all of these features, but as add-ons. The strength of Drupal is that they come with a default installation with sensible defaults that are easily modified.

#### Recommended Service Providers

* [Acquia](https://www.acquia.com). Acquia has additional services beyond hosting, such as [Lift](https://www.acquia.com/products-services/acquia-lift), which allows for intelligent customization of content on a per-user basis.
* [Pantheon](https://pantheon.io)
