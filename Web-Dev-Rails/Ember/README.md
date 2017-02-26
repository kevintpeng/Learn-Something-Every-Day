# Ember
Using ember in the context as a front end for a rails API

### Ember CLI
- Broccoli compiles the project and serves it with Express.js
- Asynchronous Module Definition (AMD) is a specification of Javascript, can be transpiled to from ES6
- Ember CLI expects ES6 Modules 
  - code is transpiled to AMD, then loaded with loader.js
- Ember orchestrates all of our files, but we design it in a way that we import Ember from ember, and then export whatever the file represents (a model, route, etc...) as the default export (scopes the export into the importing file)
- Ember's resolver returns whatever is required at each stage (templates, routes, services ...)
- DS.JSONAPIAdapter translates a standard JSON API response into a js object
  - lots of other adapters and serializers to choose from

### Prerequisite
Promise object (js) is the native way of handling asynchronous calculations, and can return a value that may be available now, later or never
- takes a function parameter that handles the outcome of the Promise (whether it be accepted or rejected)
- acts as a proxy to a value that may not be available yet, but promises for a value at some points
- Promise has 3 states: pending, fulfilled, rejected
- fulfilled transitions to an async action and returned value for the promise

### Under the Hood
Every Ember application is an extension of `Ember.Application`, configurations and declarations of all objects in the given app
- on boot, `Ember.ApplcationInstance` object is instantiated 

### Object Model
Classes: `Ember.Object.extend({})`
- `Ember.computed('...')`
- `Ember.observed('...')`
- Bindings `Ember.computed.alias('...')`

### Routing
`router.js` forwards the user for a given URL to their respective Route objects (in `app/routes/`) which access their respective models or controllers
- responsible for everything related to **application setup**
- each route can then load models by defining the model() method in a route, then using `this.store` in controller
- by default renders the template with the same file path as the route, adjusted to `templates/`
- follow the conventional rest-URLs for rails resources
- again, `router.js` forwards the user request to `app/routes/*`

### UI Components & Handlebars
Modular UI elements, from `generate component <name>`
- also use .hbs (handlebars)
- handlebars expression is denoted by `{{}}`
- not usually but can be precompiled to HTML directly
- think rails partials

```html
<script id="entry-template" type="text/x-handlebars-template">
  <div class="entry">
    <h1>{{title}}</h1>
    <div class="body">
      {{body}}
    </div>
  </div>
</script>
```

```javascript
// then compile template
var source   = $("#entry-template").html();
var template = Handlebars.compile(source);
// for pre-compilation
var context = {title: "My New Post", body: "This is my first post!"};
var html    = template(context);
```

**Block Expressions** allow us to define helpers `{{#list people}}{{firstName}} {{lastName}}{{/list}}`
- to get this to work, in JS we do `Handlebars.registerHelper('list', function(items, options) {...});`

**Actions** are defined in routes and controllers and act as event handlers from the UI -> Route -> Controller -> Model
- `{{action "actionName" parameters}}` in hbs

`{{outlet}}` is synonomous to `yield` in `erb`, rendering the application template as the main template, and the specific template associated with the route in the {{outlet}} portion

`<button {{action "save"}}>` triggers action `cancel` on click
- actions is a list, under Ember.Component.extend
- these actions run in the context of components 

### Components
Component names must have one dash in their name by convention
- components can be hbs files for visuals, or js for action functionality
- `{{my-component param1=value}}`
- components are referenced from templates with `{{friends/edit-form model=model}}`
- isolated in scope, unaware of the parent template
  - think of as a rendering function (you can pass some environment to the function

### Templating Hierachy 
`{{outlet}}` is used like rails `yield` in nested views, for hierarchal templating
- [ application.hbs [ friends.hbs [ friends/index.hbs ] ] ] 

### Store
`Store` is an ember data class, manages everything related to our model's data
- it knows about all the records we have loaded into the application
  - has functions for querying them
- for duration of a life cycle, there is a unique instance of the Store, injected into every route controller serializer and adapter under the key store
  - why we call `.store` in Routes, to access this unique object
  - `registry.injection()`


