---
title: "Building RNSSNC II: Basic frontend"
description: From Hello World to MVP
date: 2022-03-23
---

This is supposed to be an RSS reader, so let's add an RSS package.

```sh
$ npm i rss-parser
```

Upon requiring this in `app.js`, we get hit with a bunch of errors like this:

```sh
ERROR in ./node_modules/xml2js/lib/parser.js 17:17-47
Module not found: Error: Can't resolve 'timers' in '/home/sm/src/rnssnc/node_modules/xml2js/lib'

BREAKING CHANGE: webpack < 5 used to include polyfills for node.js core modules by default.
This is no longer the case. Verify if you need this module and configure a polyfill for it.

If you want to include a polyfill, you need to:
	- add a fallback 'resolve.fallback: { "timers": require.resolve("timers-browserify") }'
	- install 'timers-browserify'
If you don't want to include a polyfill, you can use an empty module like this:
	resolve.fallback: { "timers": false }
 @ ./node_modules/xml2js/lib/xml2js.js 12:11-30
 @ ./node_modules/rss-parser/lib/parser.js 4:15-32
 @ ./node_modules/rss-parser/index.js 3:0-40
 @ ./src/components/Feed.js 14:0-32 45:21-27
 @ ./src/App.js 4:0-37 9:38-42 11:39-43 13:39-43 15:39-43 17:39-43
 @ ./src/index.js 3:0-24 4:50-53
```

So Webpack 5 is kind of a big deal. As far as I understand, this is an attempt to ensure that
noobs like me don't accidentally use node packages that aren't intended for the browser. Okay, fine.
Let's give them what they want.

```json
resolve: {
  extensions: ["*", ".js", ".jsx"],
  fallback: {
    "stream": require.resolve("stream-browserify"),
    "http": require.resolve("stream-http"),
    "https": require.resolve("https-browserify"),
    "url": require.resolve("url/"),
    "buffer": require.resolve("buffer/"),
    "timers": require.resolve("timers-browserify")
  }
}
```

This appeases the Webpack god.

## Setting up the HTML skeleton

Here's `public.html`, in other words the app's exoskeleton:

```html
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>RNSSNC</title>
</head>

<body>
  <header>
    <span id="brand"><span class="highlight">r</span>n<span class="highlight">ss</span>nc</span>

    <nav>
      <input placeholder="Search..." />

      <button>Settings</button>
    </nav>
  </header>

  <main id="root"></main>
  <noscript>
    You need to enable JavaScript to run this app.
  </noscript>
  <script src="../dist/bundle.js"></script>
</body>

</html>
```

Compare the `public.html` in the previous post. 

Here's `src/App.css`:

```css
html {
  background-color: #fffff7;
  color: #111;
  font: 18px/1.6 sans-serif;
}

body {
  max-width: 1200px;
  margin: auto;
}

body > header {
  margin: 1.6em 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

body > main {
  display: flex;
  flex-wrap: wrap;
}

#brand {
  text-transform: uppercase;
  letter-spacing: 2px;
}

#brand .highlight {
  color: #e80840;
}

.app {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-gap: 1rem;
}

.feed {
  height: calc(12 * 1.6em);
  overflow-y: scroll;
}

.feed > header {
  position: sticky;
  top: 0px;
  padding: 3px 10px;
  background: linear-gradient(to bottom, white, #ddd);
  border-radius: 10px;
}

.feed-title {
  font-weight: bold;
}

.feed-subtitle {
  font-size: 0.75rem;
  color: #777;
}

.link {
  display: grid;
  grid-template-columns: 4ch auto;
  grid-gap: 1ch;
}

.link time {
  color: #777;
  font-size: 0.875rem;
  text-align: right;
}
```

## Writing the components

All we should need for an MVP are a root component and a component for a single feed.

### Root

There isn't much to see here.

```jsx
import React from 'react';
import { hot } from 'react-hot-loader';

import './App.css';
import Feed from './components/Feed';

const App = () => {
  return (
    <div className="app">
      <Feed url='https://www.questionablecontent.net/QCRSS.xml' />
      <Feed url='https://www.sophiescuppatea.com/blogs/news.atom' />
      <Feed url='https://permapeople.org/blog/feed.xml' />
      <Feed url='https://stackexchange.com/feeds/questions' />
      <Feed url='https://www.atlasobscura.com/feeds/latest' />
    </div>
  );
};

export default hot(module)(App);
```

This is basically all boilerplate. The only thing that may warrant some explanation is
the hot-loader stuff, but a modicum of thought should tell you what it's doing.

### Feed

Now we encounter the interesting stuff!

```jsx
import React, { useState, useEffect, useCallback } from 'react';
import Parser from 'rss-parser';

function timeToCode(date) {
  let millis = new Date() - new Date(date);
  let seconds = Math.floor(millis / 1000);

  const units = [["y", 60 * 60 * 24 * 7 * 52],
                 ["w", 60 * 60 * 24 * 7],
                 ["d", 60 * 60 * 24],
                 ["h", 60 * 60],
                 ["m", 60],
                 ["s", 0]];

  let smallerUnits = units.filter(([name, length]) => (seconds >= length));

  let [name, length] = smallerUnits[0];

  return `${Math.floor(seconds / length)}${name}`;
}
```

The imports are what you'd expect. The `timeToCode()` function is a five-minute hack that works fine for right now.{{% sidenote %}}Yes, it's not exactly precise across things like week boundaries, and it breaks on dates in the future, but right now I don't care. This can be factored out to [a tested library](https://www.npmjs.com/package/javascript-time-ago) later. No point reinventing the wheel.{{% /sidenote %}} 

The body of this component uses each of the [two main hooks](https://reactjs.org/docs/hooks-reference.html#basic-hooks) in the usual order they come in, so it makes a great basic example:

```jsx
// The `Feed` component depends on the `url` property.
const Feed = ({ url }) => { 

  // We have one state field, which represents an object returned from `rss-parser`, so we initialize it to the empty object.
  // The `useState()` hook returns the field and its setter.
  let [feed, setFeed] = useState({});

  // The `useEffect()` hook defines something that will run in the background --- a side effect.
  // This code uses someone else's proxy to circumvent CORS, which you obviously shouldn't do in prod. We'll set up our own proxy later.
  const getFeed = () => {
    let parser = new Parser();
    const CORS_PROXY = "https://cors-anywhere.herokuapp.com/";

    parser.parseURL(CORS_PROXY + url, (err, feed) => {
      if (err) {
        throw err;
      }

      setFeed(feed);
    });
  };

  // The second argument to `useEffect` is a list of dependencies --- that is, the effect will rerun when any dependency changes.
  // Anything from component-level scope used inside the effect needs to be declared as a dependency.
  useEffect(getFeed, [url, setFeed]);

  return (<section className="feed">
    <header>
      // We use placeholder values here in case of `undefined`.
      <span className="feed-title">{feed.title || "Feed title"}</span>
      <br />
      <span className="feed-subtitle">{feed.description || ""}</span>
    </header>

    <main>
      // We need a ternary here because we're calling a method on the value.
      { feed.items ? feed.items.map( item =>
        <div className="link">
          <time datetime={item.pubDate}>{timeToCode(item.pubDate)}</time>
          <a href={item.link}>
            {item.title}
          </a>
        </div>
        ) : "Feed items"
      }
    </main>
  </section>);
};

export default Feed;
```

When we try to run this, we're hit with --- what do you know --- [another Webpack error](https://stackoverflow.com/questions/65018431/webpack-5-uncaught-referenceerror-process-is-not-defined):

```json
_stream_readable.js:905 Uncaught (in promise) ReferenceError: process is not defined
    at resume (_stream_readable.js:905)
    at exports.IncomingMessage.Readable.resume (_stream_readable.js:895)
    at exports.IncomingMessage.Readable.on (_stream_readable.js:813)
    at module.exports.eval (parser.js:92)
    at module.exports.emit (events.js:153)
    at module.exports.ClientRequest._connect (request.js:265)
    at eval (request.js:153)

Feed.js:56 Uncaught ReferenceError: Buffer is not defined
    at eval (response.js:50)
    at new Promise (<anonymous>)
    at Object.write (response.js:47)
```

It should be noted that this error, as well as the one before it, is trying to tell us something. `process` is [an event emitter for the running Node *process*](https://nodejs.org/api/process.html#process). In other words, it's a backend thing, and using it in the frontend is bad form. Once we have a backend, we'll move the `rss-parser` stuff there.

Fortunately for now, the necessary shims are easy to add to `webpack.config.js`:

```json
plugins: [
  new webpack.HotModuleReplacementPlugin(),
  new webpack.ProvidePlugin({ process: 'process/browser' }),
  new webpack.ProvidePlugin({ Buffer: ['buffer', 'Buffer'] })
]
```

And this brings us to a barely-working app!
