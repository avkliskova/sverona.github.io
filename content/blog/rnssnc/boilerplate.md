---
title: "Building RNSSNC I: Boilerplate in 2022"
description: Covering the bare basics of React, Babel, and Webpack configuration.
date: 2022-03-21
---

This post functions as something of an update to the wonderful article [Creating a React App From Scratch](https://scribe.rip/@JedaiSaboteur/creating-a-react-app-from-scratch-f3c693b84658)
by the wonderful [Jedai Saboteur](https://twitter.com/jedaisaboteur), which hasn't been updated since 2018.
We'll get React, Babel, and Webpack set up *without* having to wait for `create-react-app` to do its thing,
dealing with a few issues that have cropped up over the years.

## Setup

No changes need to be made to this section. First, we initialize the NPM manifest and the usual React directory structure.

```sh
$ npm init -y
$ mkdir public src
```

We then insert the exoskeleton of the app into `public/index.html`.

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

## Babel

Again, the code in this section runs fine without modification. Go check out the Saboteur post for more on what this does.
We install the necessary packages:

```sh
$ npm i -D @babel/{core,cli,preset-env,preset-react}
```

And fill out `.babelrc`:

```json
{ "presets": [
  ["@babel/env",
    {
      "targets": {
        "edge": "17",
        "firefox": "60",
        "chrome": "67",
        "safari": "11.1"
      }
    }
  ],
  "@babel/preset-react"
]}
```

## Webpack

This is the fiddly one, owing to a lot of [breaking changes in Webpack 5](https://webpack.js.org/blog/2020-10-10-webpack-5-release/),
circa October 2020.{{% sidenote %}}Incidentally, [this is exactly why I got fed up with CRA](https://github.com/facebook/create-react-app/issues/11756).{{% /sidenote %}}
We have some more dependencies to install.

```sh
$ npm i -D webpack{,-cli,-dev-server} {style,css,babel}-loader
```

Filling out `webpack.config.js` as in the Saboteur post and starting the server errors:

```sh
$ npx webpack-dev-server --mode development 
[webpack-cli] Invalid options object. Dev Server has been initialized using an options object that does not match the API schema.
 - options has an unknown property 'hotOnly'. These properties are valid:
   object { allowedHosts?, bonjour?, client?, compress?, devMiddleware?, headers?, historyApiFallback?, host?, hot?, http2?, https?, ipc?, liveReload?, magicHtml?, onAfterSetupMiddleware?, onBeforeSetupMiddleware?, onListening?, open?, port?, proxy?, server?, setupExitSignals?, setupMiddlewares?, static?, watchFiles?, webSocketServer? }
```

So we change `hotOnly: true` to `hot: "only"`. Now we get a similar error that complains about `publicPath`. In fact, more or less the entire config structure of `webpack-dev-server` [has been changed](https://github.com/webpack/webpack-dev-server/blob/master/migration-v4.md). The correct incantation is now

```json
devServer: {
  static: {
    directory: path.join(__dirname, "public/")
  },
  port: 3000,
  devMiddleware: {
    publicPath: "http://localhost:3000/dist/",
  },
  hot: "only"
}
```

Substituting this in, we obtain a running server and a single warning.

```sh
<w> [webpack-dev-server] "hot: true" automatically applies HMR plugin, you don't have to add it manually to your webpack configuration.
```

Which is to say that we can delete the entry under `plugins`.

We'll see some more Webpack drama in a bit, but this is all we need to get the server up and running.
