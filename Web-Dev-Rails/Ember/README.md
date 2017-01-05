# Ember
### Prerequisite
Promise object (js) is the native way of handling asynchronous calculations, and can return a value that may be available now, later or never
- takes a function parameter that handles the outcome of the Promise (whether it be accepted or rejected)
- acts as a proxy to a value that may not be available yet, but promises for a value at some points
- Promise has 3 states: pending, fulfilled, rejected
- fulfilled transitions to an async action and returned value for the promise

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
