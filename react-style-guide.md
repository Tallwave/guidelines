# Tallwave React/JSX Style Guide

*Forked and slightly modified from [Airbnb's](https://github.com/airbnb/javascript/blob/master/react/README.md)*

## Table of Contents

  1. [Basic Rules](#basic-rules)
  1. [Class vs `React.createClass` vs stateless](#class-vs-reactcreateclass-vs-stateless)
  1. [Naming](#naming)
  1. [Declaration](#declaration)
  1. [Alignment](#alignment)
  1. [Quotes](#quotes)
  1. [Spacing](#spacing)
  1. [Props](#props)
  1. [Refs](#refs)
  1. [Parentheses](#parentheses)
  1. [Tags](#tags)
  1. [Methods](#methods)
  1. [Ordering](#ordering)
  1. [`isMounted`](#ismounted)

## Basic Rules

  - Only include one React component per file.
    - However, multiple [Stateless, or Pure, Components](https://facebook.github.io/react/docs/reusable-components.html#stateless-functions) are allowed per file. eslint: [`react/no-multi-comp`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/no-multi-comp.md#ignorestateless).
  - Always use JSX syntax.
  - Do not use `React.createElement` unless you're initializing the app from a file that is not JSX.

## Class vs `React.createClass` vs stateless

  - Prefer ES2015 classes in nearly all cases. `React.createClass` is not necessary with ES2015 and makes method binding easier.

   > Why not const functions? For the simplest cases (one-liners), const functions are ok. The general recommendation is to switch over to a class when you start to add internal state to a Component. However, if you're like me you are exceedingly lazy and don't always switch things over when you should and end up with gnarly looking methods that are annoying to refactor. Starting with classes avoids this problem altogether.

   eslint: [`react/prefer-es6-class`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/prefer-es6-class.md)

    ```jsx
    // bad
    const Listing = React.createClass({
      // ...
      render() {
        return <div>{this.state.hello}</div>;
      }
    });

    // bad
    function Listing({ hello, firstCallback, secondCallback }) {
      return (
        <div>
          {hello}
          When in the course of human events, it becomes self-evident...
          <div className="buttonBar">
            <button onClick={firstCallback}/>
            <button onClick={secondCallback}/>
          </div>
        </div>
        );
    }

    // good
    class Listing extends React.Component {
      // ...
      render() {
        return <div>{this.state.hello}</div>;
      }
    }

    // ok if your Component is this simple, but then why do you need a component for that?
    function Listing({ hello }) {
      return <div>{hello}</div>;
    }
    ```

## Naming

  - **Extensions**: Use `.jsx` extension for React components.
  - **Filename**: Use PascalCase for filenames. E.g., `ReservationCard.jsx`.
  - **Reference Naming**: Use PascalCase for React components and camelCase for their instances. eslint: [`react/jsx-pascal-case`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-pascal-case.md)

    ```jsx
    // bad
    import reservationCard from './ReservationCard';

    // good
    import ReservationCard from './ReservationCard';

    // bad
    const ReservationItem = <ReservationCard />;

    // good
    const reservationItem = <ReservationCard />;
    ```

  - **Component Naming**: Use the filename as the component name. For example, `ReservationCard.jsx` should have a reference name of `ReservationCard`. However, for root components of a directory, use `index.jsx` as the filename and use the directory name as the component name:

    ```jsx
    // bad
    import Footer from './Footer/Footer';

    // bad
    import Footer from './Footer/index';

    // good
    import Footer from './Footer';
    ```
  - **Higher-order Component Naming**: Use a composite of the higher-order component's name and the passed-in component's name as the `displayName` on the generated component. For example, the higher-order component `withFoo()`, when passed a component `Bar` should produce a component with a `displayName` of `withFoo(Bar)`.

  > Why? A component's `displayName` may be used by developer tools or in error messages, and having a value that clearly expresses this relationship helps people understand what is happening.

    ```jsx
    // bad
    export default function withFoo(WrappedComponent) {
      return function WithFoo(props) {
        return <WrappedComponent {...props} foo />;
      }
    }

    // good
    export default function withFoo(WrappedComponent) {
      function WithFoo(props) {
        return <WrappedComponent {...props} foo />;
      }

      const wrappedComponentName = WrappedComponent.displayName
        || WrappedComponent.name
        || 'Component';

      WithFoo.displayName = `withFoo(${wrappedComponentName})`;
      return WithFoo;
    }
    ```

  - **Props Naming**: Avoid using DOM component prop names for different purposes.

  > Why? People expect props like `style` and `className` to mean one specific thing. Varying this API for a subset of your app makes the code less readable and less maintainable, and may cause bugs.

    ```jsx
    // bad
    <MyComponent style="fancy" />

    // good
    <MyComponent variant="fancy" />
    ```

## Declaration

  - Do not use `displayName` for naming components. Instead, name the component by reference.

    ```jsx
    // bad
    export default React.createClass({
      displayName: 'ReservationCard',
      // stuff goes here
    });

    // good
    export default class ReservationCard extends React.Component {
    }
    ```

## Alignment

  - Follow these alignment styles for JSX syntax. eslint: [`react/jsx-closing-bracket-location`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-closing-bracket-location.md)

    ```jsx
    // bad
    <Foo superLongParam="bar"
         anotherSuperLongParam="baz" />

    // good
    <Foo
      superLongParam="bar"
      anotherSuperLongParam="baz"
    />

    // if props fit in one line then keep it on the same line
    <Foo bar="bar" />

    // children get indented normally
    <Foo
      superLongParam="bar"
      anotherSuperLongParam="baz"
    >
      <Quux />
    </Foo>
    ```

## Quotes

  - Always use double quotes (`"`) for JSX attributes, but single quotes (`'`) for all other JS. eslint: [`jsx-quotes`](http://eslint.org/docs/rules/jsx-quotes)

  > Why? Regular HTML attributes also typically use double quotes instead of single, so JSX attributes mirror this convention.

    ```jsx
    // bad
    <Foo bar='bar' />

    // good
    <Foo bar="bar" />

    // bad
    <Foo style={{ left: "20px" }} />

    // good
    <Foo style={{ left: '20px' }} />
    ```

## Spacing

  - Always include a single space in your self-closing tag. eslint: [`no-multi-spaces`](http://eslint.org/docs/rules/no-multi-spaces), [`react/jsx-space-before-closing`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-space-before-closing.md)

    ```jsx
    // bad
    <Foo/>

    // very bad
    <Foo                 />

    // bad
    <Foo
     />

    // good
    <Foo />
    ```

  - Do not pad JSX curly braces with spaces. eslint: [`react/jsx-curly-spacing`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-curly-spacing.md)

    ```jsx
    // bad
    <Foo bar={ baz } />

    // good
    <Foo bar={baz} />
    ```

## Props

  - Always use camelCase for prop names.

    ```jsx
    // bad
    <Foo
      UserName="hello"
      phone_number={12345678}
    />

    // good
    <Foo
      userName="hello"
      phoneNumber={12345678}
    />
    ```

  - Omit the value of the prop when it is explicitly `true`. eslint: [`react/jsx-boolean-value`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-boolean-value.md)

    ```jsx
    // bad
    <Foo
      hidden={true}
    />

    // good
    <Foo
      hidden
    />
    ```

  - Always include an `alt` prop on `<img>` tags. If the image is presentational, `alt` can be an empty string or the `<img>` must have `role="presentation"`. eslint: [`jsx-a11y/img-has-alt`](https://github.com/evcohen/eslint-plugin-jsx-a11y/blob/master/docs/rules/img-has-alt.md)

    ```jsx
    // bad
    <img src="hello.jpg" />

    // good
    <img src="hello.jpg" alt="Me waving hello" />

    // good
    <img src="hello.jpg" alt="" />

    // good
    <img src="hello.jpg" role="presentation" />
    ```

  - Do not use words like "image", "photo", or "picture" in `<img>` `alt` props. eslint: [`jsx-a11y/img-redundant-alt`](https://github.com/evcohen/eslint-plugin-jsx-a11y/blob/master/docs/rules/img-redundant-alt.md)

  > Why? Screenreaders already announce `img` elements as images, so there is no need to include this information in the alt text.

    ```jsx
    // bad
    <img src="hello.jpg" alt="Picture of me waving hello" />

    // good
    <img src="hello.jpg" alt="Me waving hello" />
    ```

  - Use only valid, non-abstract [ARIA roles](https://www.w3.org/TR/wai-aria/roles#role_definitions). eslint: [`jsx-a11y/aria-role`](https://github.com/evcohen/eslint-plugin-jsx-a11y/blob/master/docs/rules/aria-role.md)

    ```jsx
    // bad - not an ARIA role
    <div role="datepicker" />

    // bad - abstract ARIA role
    <div role="range" />

    // good
    <div role="button" />
    ```

  - Do not use `accessKey` on elements. eslint: [`jsx-a11y/no-access-key`](https://github.com/evcohen/eslint-plugin-jsx-a11y/blob/master/docs/rules/no-access-key.md)

  > Why? Inconsistencies between keyboard shortcuts and keyboard commands used by people using screenreaders and keyboards complicate accessibility.

  ```jsx
  // bad
  <div accessKey="h" />

  // good
  <div />
  ```

  - Avoid using an array index as `key` prop, prefer a unique ID. ([why?](https://medium.com/@robinpokorny/index-as-a-key-is-an-anti-pattern-e0349aece318))

  ```jsx
  // bad
  {todos.map((todo, index) =>
    <Todo
      {...todo}
      key={index}
    />
  )}

  // good
  {todos.map(todo => (
    <Todo
      {...todo}
      key={todo.id}
    />
  ))}
  ```

  - Always define explicit defaultProps for all non-required props.

  > Why? propTypes are a form of documentation, and providing defaultProps means the reader of your code doesn’t have to assume as much. In addition, it can mean that your code can omit certain type checks.

  ```jsx
  // bad
  function SFC({ foo, bar, children }) {
    return <div>{foo}{bar}{children}</div>;
  }
  SFC.propTypes = {
    foo: PropTypes.number.isRequired,
    bar: PropTypes.string,
    children: PropTypes.node,
  };

  // good
  function SFC({ foo, bar }) {
    return <div>{foo}{bar}</div>;
  }
  SFC.propTypes = {
    foo: PropTypes.number.isRequired,
    bar: PropTypes.string,
  };
  SFC.defaultProps = {
    bar: '',
    children: null,
  };
  ```

## Refs

  - Always use ref callbacks. eslint: [`react/no-string-refs`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/no-string-refs.md)

    ```jsx
    // bad
    <Foo
      ref="myRef"
    />

    // good
    <Foo
      ref={ref => { this.myRef = ref; }}
    />
    ```
 - Do strongly consider the reason for using a ref, it is subtly introducing a state-like construct, and may cause side-effects.    


## Parentheses

  - Wrap JSX tags in parentheses when they span more than one line. eslint: [`react/wrap-multilines`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/wrap-multilines.md)

    ```jsx
    // bad
    render() {
      return <MyComponent className="long body" foo="bar">
               <MyChild />
             </MyComponent>;
    }

    // good
    render() {
      return (
        <MyComponent className="long body" foo="bar">
          <MyChild />
        </MyComponent>
      );
    }

    // good, when single line
    render() {
      const body = <div>hello</div>;
      return <MyComponent>{body}</MyComponent>;
    }
    ```

## Tags

  - Always self-close tags that have no children. eslint: [`react/self-closing-comp`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/self-closing-comp.md)

    ```jsx
    // bad
    <Foo className="stuff"></Foo>

    // good
    <Foo className="stuff" />
    ```

  - If your component has multi-line properties, close its tag on a new line. eslint: [`react/jsx-closing-bracket-location`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-closing-bracket-location.md)

    ```jsx
    // bad
    <Foo
      bar="bar"
      baz="baz" />

    // good
    <Foo
      bar="bar"
      baz="baz"
    />
    ```

## Methods

  - Use arrow functions to close over local variables.

    ```jsx
    function ItemList(props) {
      return (
        <ul>
          {props.items.map((item, index) => (
            <Item
              key={item.key}
              onClick={() => doSomethingWith(item.name, index)}
            />
          ))}
        </ul>
      );
    }
    ```

  - Prefer using [property initializers](https://facebook.github.io/react/blog/2015/01/27/react-v0.13.0-beta-1.html#autobinding) when binding UI callback methods.

  > Why? Property intializers saves a little bit of code and means you don't have to override constructors.

    ```jsx
    // bad
    class extends React.Component {
      onClickDiv() {
        // do stuff
      }

      render() {
        return <div onClick={this.onClickDiv.bind(this)} />
      }
    }

    // still not the best
    class extends React.Component {
      constructor(props) {
        super(props);

        this.onClickDiv = this.onClickDiv.bind(this);
      }

      onClickDiv() {
        // do stuff
      }

      render() {
        return <div onClick={this.onClickDiv} />
      }
    }

    // good
    class extends React.Component {

      onClickDiv = () => {
        // do stuff
      }

      render() {
        return <div onClick={this.onClickDiv} />
      }
    }
    ```

  - Do not use underscore prefix for internal methods of a React component.
  > Why? Underscore prefixes are sometimes used as a convention in other languages to denote privacy. But, unlike those languages, there is no native support for privacy in JavaScript, everything is public. Regardless of your intentions, adding underscore prefixes to your properties does not actually make them private, and any property (underscore-prefixed or not) should be treated as being public. See issues [#1024](https://github.com/airbnb/javascript/issues/1024), and [#490](https://github.com/airbnb/javascript/issues/490) for a more in-depth discussion.

    ```jsx
    // bad
    React.createClass({
      _onClickSubmit() {
        // do stuff
      },

      // other stuff
    });

    // good
    class extends React.Component {
      onClickSubmit() {
        // do stuff
      }

      // other stuff
    }
    ```

  - Be sure to return a value in your `render` methods. eslint: [`react/require-render-return`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/require-render-return.md)

    ```jsx
    // bad
    render() {
      (<div />);
    }

    // good
    render() {
      return (<div />);
    }
    ```

## Ordering

  - Ordering for `class extends React.Component`:

    1. optional `static` methods
    1. `constructor`
    1. `getChildContext`
    1. `componentWillMount`
    1. `componentDidMount`
    1. `componentWillReceiveProps`
    1. `shouldComponentUpdate`
    1. `componentWillUpdate`
    1. `componentDidUpdate`
    1. `componentWillUnmount`
    1. *clickHandlers or eventHandlers* like `onClickSubmit()` or `onChangeDescription()`
    1. *getter methods for `render`* like `getSelectReason()` or `getFooterContent()`
    1. *optional render methods* like `renderNavigation()` or `renderProfilePicture()`
    1. `render`

  - How to define `propTypes`, `defaultProps`, `contextTypes`, etc...

  > A Future ECMAScript release may allow improved static property syntax right within the class definition, but that is still up in the air, so for now, define them _after_ the class definition.

    ```jsx

    import React, { PropTypes } from 'react';

    class Link extends React.Component {
      static methodsAreOk() {
        return true;
      }

      render() {
        return <a href={this.props.url} data-id={this.props.id}>{this.props.text}</a>
      }
    }

    Link.propTypes = {
      id: PropTypes.number.isRequired,
      url: PropTypes.string.isRequired,
      text: PropTypes.string,
    };

    Link.defaultProps = {
      text: 'Hello World',
    };

    export default Link;
    ```

## `isMounted`

  - Do not use `isMounted`. eslint: [`react/no-is-mounted`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/no-is-mounted.md)

  > Why? [`isMounted` is an anti-pattern][anti-pattern], is not available when using ES6 classes, and is on its way to being officially deprecated.

  [anti-pattern]: https://facebook.github.io/react/blog/2015/12/16/ismounted-antipattern.html
