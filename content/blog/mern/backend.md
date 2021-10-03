---
title: "Annotated MERN II: Backend"
date: 2021-10-02
description: Annotations for the Express and Mongo/Mongoose part of the repo.
---

This post continues our look at [James Vickery](https://github.com/jmsv)'s [simple-mern](https://github.com/jmsv/simple-mern) repository. Today we'll look at the backend, which is built in Express and Mongo and located under the `client/` folder.

## index.js

This is the root Express server and router. Here are the libraries.

```js
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
```

First we load the Express server and any routes we may need. There's just the one.

```js
const app = express();

const routeTasks = require('./src/routes/tasks');
```

The next section specifies the different routes and middleware. This is where Flask would use decorators.

These two are *middleware layers.* The path `./client/build` will be served statically, and request bodies containing JSON will be parsed into proper JSON, as would happen with `JSON.parse()`.
```js
app.use(express.static(path.join(__dirname, 'client/build')));
app.use(bodyParser.json());
```

This is a dedicated *router.* We'll get into what it does below, but it's like a submodule that handles routes beginning with `/api/tasks`. When we get to it, we'll see that it implements CRUD operations, which will be routed under `/api/tasks/add`, `/api/tasks/delete/`, etc.

The third argument is a callback that returns a 401 error; it will be executed if nothing matches under `routeTasks`.

The callbacks take two arguments `req` and `res`, for "request" and "response" respectively. To return a response, you call a method of `res`.
```js
app.use('/api/tasks', routeTasks, (req, res) => res.sendStatus(401));
```

This last one is a catchall router for things that match none of the previous --- it just routes the user back to `index.html`, the root page.
```js
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname + '/client/build/index.html'));
});
```

Finally, we start the server. `process.env.PORT` resolves to the environment variable `$PORT` if it is set.
```js
const port = process.env.PORT || 5000;
app.listen(port);

console.log(`listening on ${port}`);
```

## src/
This folder contains two subfolders, `models/` and `routes/`. Each of these contains a Mongoose model/Express router for each application datatype. As it happens, there's only one, so we have only two files (plus the one that establishes the database connection) to discuss.

### src/db.js
This file is very simple; it does nothing but establish a connection to MongoDB through Mongoose.

```js
const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/simple-mern')

module.exports = mongoose;
```

Note that the structure of this file means that calling `require('db')` establishes a database connection. Nice.

### src/models/task.js
This is a simple object model using Mongoose. There are two fields.

```js
const mongoose = require('../db');

const task = new mongoose.Schema({
  title: { type: String, required: true },
  done: { type: Boolean, default: false }
});

const Task = mongoose.model('Task', task);
module.exports = Task;
```

### src/routes/tasks.js
Here we find the CRUD routes for the Task model. Note the plural filename, since these routes act on a *collection of tasks.* First we import Express and our model.

```js
const express = require('express');

const Task = require('../models/task');
```

Next we set up a `Router` object. This catches the requests that come from the root Express router.
```js
const router = express.Router();
```

Now we have the actual routes. These have the same form as the ones we saw previously.

This one does a search of all `Tasks` with an empty filter, which returns them all, then returns that as the JSON response.

Errors are caught and returned as a `500` response.
```js
router.get('/', (req, res) => {
  Task.find({})
    .then(tasks => res.json(tasks))
    .catch(err => res.status(500).json({ error: err }));
});
```

The other three routes are very similar. The only thing that changes is which `mongoose` method is called; the names are self-explanatory, as is the mapping of CRUD to HTTP verbs.

Note the destructuring assignment used on `req.body`; this builds on the `body-parser` middleware used in `index.js`.
```js
router.post('/add', (req, res) => {
  const { title } = req.body;
  const newTask = new Task({ title });

  newTask.save()
    .then(task => res.json(task))
    .catch(err => res.json(500, err));
});

router.delete('/delete/:id', (req, res) => {
  const id = req.params.id;

  Task.findByIdAndDelete(id)
    .then(task => res.json(task))
    .catch(err => res.json(500, err));
});

router.post('/update/:id', (req, res) => {
  const { done } = req.body;
  Task.findByIdAndUpdate(req.params.id, { done })
    .then(task => res.json(task))
    .catch(err => res.json(500, err));
});
```

Finally, we set this as the default export.
```js
module.exports = router;
```

In the next post, we'll discuss the React frontend.
