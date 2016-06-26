# Javascript
- Client-side js extends core language, supplying objects to control ba browser and it's Document Object Model (DOM)
  - respond to user events, form inputs, page navigation
- server-side js extends core by allowing communication with a database, file manipulation. Node.js is one server-side solution

### Basics, Variables and Scoping
- case sensitive, unicode, semicolon delimited statements, java-like comments
- `var x = 42` (local or global), `let` declared a block scope local variable, `const` read only
- variables are by default global
- variable hoisting is when you reference a variable that is defined later, yields `undefined` instead of error (wtf, why is this a thing)
- global vars are properties of the global object
  - in a web page, `window` is the global object

### Data structures and types
- Boolean, null, undefined, Number, String, Symbol, Object
- dynamically typed, variable can hold any type
- `parseInt()`, `parseFloat()` convert strings 
- ruby-like array literals, ruby-like regexes
- Object literals are a list of zero or more pairs of property names and values, methods are just lambda functions

### Functions
`function`, name, args, `{` statements `}`
