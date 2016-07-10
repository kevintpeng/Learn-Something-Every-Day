# Cookie  -- [source](http://www.tcpipguide.com/free/t_HTTPStateManagementUsingCookies.htm)
HTTP is entirely stateless. Eac htime a server receives a request from a client, it processes the request, sends response, and forgets about the request.
- the intended use of HTTP has shifted to require knowledge of state, no longer just for resource retrieval 
- **state management** stores the state of a client session across multiple HTTP transactions
- cookies store small amounts of data (username, pass, things like shopping carts)

### Issues
- Sensitive information: messages for cookies that store passwords could be intercepted 
- Misuse: any server can set cookies, can be misused for tracking purposes 
- Third-Party Unintentional cookies:
