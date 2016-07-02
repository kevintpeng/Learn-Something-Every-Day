# Javascript
- Client-side js extends core language, supplying objects to control ba browser and it's Document Object Model (DOM)
  - respond to user events, form inputs, page navigation
- server-side js extends core by allowing communication with a database, file manipulation. Node.js is one server-side solution

### Basics, Variables and Scoping
- case sensitive, unicode, semicolon delimited statements, java-like comments
- `console.log()` for print
- `var x = 42` (local or global), `let` declared a block scope local variable, `const` read only
- variables are by default global
- variable hoisting is when you reference a variable that is defined later, yields `undefined` instead of error (wtf, why is this a thing)
- global vars are properties of the global object
  - in a web page, `window` is the global object
- java-like `if` 

### Data structures and types
- Boolean, null, undefined, Number, String, Symbol, Object
- dynamically typed, variable can hold any type
- `parseInt()`, `parseFloat()` convert strings 
- `typeof a == 'undefined'` keyword for assertions
- ruby-like array literals, ruby-like regexes
- Object literals are a list of zero or more pairs of property names and values, methods are just lambda functions

### Functions
- `function`, name, args, `{` statements `}`, `return` keyword 
- can be defined in expressions instead: `var square = function(n) { return n*n}`
  - this is an anonymous function, not named, but assigned to a var
- vars are scoped in a function, function has access to the scope it was **defined** in
- nested functions form a closure, inner function is private to outer, inner inherits from the outer
- **closures** allow for OOP design
  - if inner function out-lives the outer function, then the variables and functions of the outer scope will out-live teh outer function itself
- `arguments` object is a special keyword, is the list of arguments in the current innermost scope
