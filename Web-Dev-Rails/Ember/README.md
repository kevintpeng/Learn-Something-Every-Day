# Ember
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
- each route can then load models by defining the model() method in a route, then using `this.store` in controller
- by default renders the template with the same file path as the route, adjusted to `templates/`

### UI Components & Handlebars
Modular UI elements, from `generate component <name>`
- also use .hbs (handlebars)
- handlebars expression is denoted by `{{}}`
- not usually but can be precompiled to HTML directly

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

### Components
Component names must have one dash in their name by convention
- components can be hbs files for visuals, or js for action functionality
- `{{my-component param1=value}}`
