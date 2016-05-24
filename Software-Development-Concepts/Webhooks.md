# Webhooks
A method of augmenting or altering the behaviour of a web page using callbacks. 
- "user-defined HTTP callbacks"
- often triggered by some event (pushing code to a repo), comment posting...
- upon event, the source site makes an HTTP request to the URI configured for the webhook
  - with github, webhooks allow you to build or set up integrations around events
  - updated external trackers, trigger CI builds, update backup mirror, deploy to production
  - webhook can be installed on an organization or repo
- [github](https://developer.github.com/webhooks/#events) has a list of events that can trigger webhooks
