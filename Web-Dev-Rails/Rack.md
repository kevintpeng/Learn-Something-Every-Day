# Rack
Provides a minimal, modular interface between webserbers that suport Ruby and Ruby frameworks. It is a layer of abstraction above the web server implementation (allowing interfacing with a Ruby app regardless of what web server and app server it's running on). It interfaces the `Net::HTTP` Ruby library.

## Rails on Rack
Rails uses Rack. `rails server` does the basic job of creating `Rack::Server` object starting the webserver.
Implementation:
```ruby
Rails::Server.new.tap do |server|
  require APP_PATH
  Dir.chdir(Rails.application.root)
  server.start
end
```

