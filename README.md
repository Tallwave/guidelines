# Guidelines

Coding and contributing guidelines for Tallwave projects.

## Table Of Contents
1. [Code of Conduct](https://github.com/Tallwave/guidelines/blob/master/CODE_OF_CONDUCT.md)
2. [Contributing to Tallwave Projects](https://github.com/Tallwave/guidelines/blob/master/CONTRIBUTING.md)
3. Style Guides
    * [Javascript](https://github.com/Tallwave/guidelines/blob/master/javascript-style-guide.md)
    * [React](https://github.com/Tallwave/guidelines/blob/master/react-style-guide.md)
    * [Swift](https://github.com/Tallwave/guidelines/blob/master/swift-style-guide.md)

## General information

With all projects, we make heavy use of [Github Flow](https://guides.github.com/introduction/flow/) for the development process.

### HTML &amp; CSS

At Tallwave, we want to write beautiful code, and make it look like the team is in sync on how to write HTML &amp; CSS. When writing CSS (and any CSS pre-processors), stick to [@mdo's code guide](http://codeguide.co/).

## Development

It is possible to run this using Docker. This avoids having to set up jekyll locally, install themes, set up SASS, etc. Just a single dependency:

* Docker

With Docker running in your system, run the following command to build the image and run the container:

```
./build.sh
```

Once the image is build, you don't have to keep building it. To make a running container of the built image, run:

```
docker-compose up
```

You should be able to see the site at `http://127.0.0.1:4000`.

**Troubleshooting**

To stop the docker container, press `CTRL + C`.

NOTE: If this produces an error, you may need to stop the running docker container that was unsuccessfully stopped. To do so, run `docker container ls` to see a list of all running containers. Take note of the first 4 digits of the container to be stopped, and run the command:

`docker stop 2bdb`
 
This will stop that running container.

Or you can instead use:

`docker-compose stop`

and then whenever you want to run the site again:

`docker-compose start`
