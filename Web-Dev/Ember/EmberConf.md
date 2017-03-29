# EmberConf
### Glimmer
- Glimmer, low level rendering pipeline, templating engine for building live DOM from hbs
- design, small kernel + addons
  - ember-engine, ember-fastboot
- Real time systems trade between first Interactivity vs Response to interaction on the web
  - fastest performance is with no updates
- source >> wire format >> append pass

### Wire Protocol/Wire Format
Some way of getting data from point to point
- interoperation of multiple applications 
- abstraction above the transport layer, describtes the representation of information at the application level
- in JS, we can represent the operations and tags in a `hbs` file in nested arrays with opcode tuples
- wire protocol may be text based or binary, the underlying implementation below the programmatic API

### Progressive Web Applications
Web App manifest; json of configurations for browsers, with metadata when you add to home screen
- native tags for ios, like the app manifest
- no navbar, offline availability, service worker, push notifications

**Service Worker** is a script that browser runs in teh background, separate from a web page
- offline experience, push notifications
- JS worker, doesn't access DOM directly, rather communicates with the pages it controls

**Local Storage** on browser stores strings within the user's web browser
- IndexDB, WebSQL

### Speed
Physics > Hardware > Kernel > Userland > Humans

JS Engines > Libraries > Code
- two perspectives: time budget, or micro vs macro
- User Timing API, CPU profiler, flame graphs
- Hidden classes for JIT compilaiton optimizations
  - `node --allow)batuves_syntax` for native syntax
  
V8 is a JS engine, doesn't generate any intermediate code, instead compiles to machine code at execution
- JS is dynamically typed, objects can change types during runtime
- V8 introduces hidden classes to track types
  - chain of hidden classes are created as objects are altered in shape

### Security
- Same-origin policy states a browser permits scripts in first page to access data from second page iff they have the same origin
  - origin = uri + scheme + hostname + port
  - prevents accessing DOM information between separate web pages
  - significant since more pages with tight coupling to cookies for authentication and sensitive information storage
- HTML Escaping (ember's rendering layer escapes HTML)
- Content Security Policy (CSP) reduces XSS risks -- [source](https://content-security-policy.com)
- external links should use `rel=noopener`, prevents cross-origin pages from accessing the source link

[https://balinterdi.com/emberconf/](https://balinterdi.com/emberconf/)

### Cardstack
Wordpress-like editing in Ember.
- mobiledoc is a platform agnostic post or article format, with no concept of layout
  - has a wrapping object, type definitions for mobiledoc-specific types
  
### SVG
XML-encoded, and dynamically rendered by browser
- follow paint order, not z-indexed
- SVG's can be interactive, and embedded directly in html with `<svg>`

### Ember-Concurrency
Small library, supplements tools and conventions for concurrency and asynchrony
- **Structured Concurrency** 

#### Arguements against Callbacks
Callback is any executable code that is passed as an argument to other code, which is expected to call back the argument a some given time. Callbacks may be synchronous or asynchronous.

The **call graph** is a control flow graph representing relationships between subroutines. A callback cycle can be created and result in a stack overflow. Lots of esoteric call graphs are derived from callback workflows.

#### Event Driven Architecture
Events in OOP translates to a message. Messages are implemented as methods, which are classic function calls
- events are sequential, in a queue called the event loop
- events raised in other events are not executed immediately, they are enqueued and wait until the current event is processed:
<img src='http://250bpm.wdfiles.com/local--files/blog:25/events2.png'>

State Machines offer a solution to callbacks too, but can be extremely large when considering every possible state and transition
- green threads are implemented at the language level. Goroutines are one example of green threads, acting as abstracted threads
  - help to eliminate state machines
- green threads can model any state machine, but require further checks to prevent thread blocking

#### Structured Concurrency
TCP uses "sessions", implemented as a process or thread. Session management involves mutable state concurrency which may require several locks, mutexes, callbacks
- simplist programming model would spawn a thread for each TCP connection, and green threads make this a lot less expensive
  - processes and pipes in unix, goroutines and channels in go
- *if a language has green threads and a cancellation mechanism, it allows for imperative programming without needomg state machines* 
- structured concurrency restricts the extent of nested green threads cannot exceed the extent of the calling green thread
- call stack in structured programming is synonomous to the call tree in structured concurrency
- cancelling needs to be implemented to handle the case where parent green threads return before children green threads
  - if parent A is waiting for child B to return, but B is an infinite loop, then A is stuck
- we only have to care about cancellation when calling functions that can switch to a new green thread (only for blocking functions)

