# Hooks
Hooking describes a range of techniques for altering behaviour of some software component by intercepting function calls, message or events passed between software components.
- debugging
- extending functionality
- intercepting hardware events (mouse clicks)

### Callback
A callback is a piece of executable code passed as an argument to be called back later.
- implemented as subroutines, lambda expressions, function pointers
- synchronous callbacks called in the function code
- deferred callbacks called after the function returns

### Webhooks
A method of augmenting or altering the behaviour of a web page using callbacks. 
- "user-defined HTTP callbacks"
- often triggered by some event (pushing code to a repo), comment posting...
- upon event, the source site makes an HTTP request to the URI configured for the webhook
  - with github, webhooks allow you to build or set up integrations around events
  - updated external trackers, trigger CI builds, update backup mirror, deploy to production
  - webhook can be installed on an organization or repo
- [github](https://developer.github.com/webhooks/#events) has a list of events that can trigger webhooks
