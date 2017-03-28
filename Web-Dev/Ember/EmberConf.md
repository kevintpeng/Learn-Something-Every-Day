# EmberConf
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

### Security
- Same-origin policy states a browser permits scripts in first page to access data from second page iff they have the same origin
  - origin = uri + scheme + hostname + port
  - prevents accessing DOM information between separate web pages
  - significant since more pages with tight coupling to cookies for authentication and sensitive information storage
- HTML Escaping (ember's rendering layer escapes HTML)
- Content Security Policy (CSP) reduces XSS risks -- [source](https://content-security-policy.com)
- external links should use `rel=noopener`, prevents cross-origin pages from accessing the source link
