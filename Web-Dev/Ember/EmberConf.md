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
