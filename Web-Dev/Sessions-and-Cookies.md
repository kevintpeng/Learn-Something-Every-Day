# Session
- session for each user, which you can store small amounts of data, persisting between requests
- session is only available in the controller and view, with access to a number of storage mechanisms
  - `ActionDispatch::Session::CookieStore`, stores everything on the client 
  - `ActionDispatch::Session::CacheStore`, data in the Rails cache
  - `ActionDispatch::Session::ActiveRecordStore`, stores the data in a database 
- all sessions use a cookie to store a unique ID for each session
- `session[:myKey] = val` adds a value to the sessions hash

# Cookies
- Applications store small amounts of data on the client, persisting across requests and even sessions
- `cookies[:myKey] = val`
- `cookies.encrypted[:expiration_date] = Date.tomorrow`

[source](http://guides.rubyonrails.org/action_controller_overview.html#session)
