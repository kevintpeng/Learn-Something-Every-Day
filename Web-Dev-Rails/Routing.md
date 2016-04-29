# Routing
### Non-Resourceful Routes
Rails can route arbitrary URLs to actions.
#### Bound Parameters 
Regular routes are series of symbols that Rails maps to parts of an HTTP request. 
`:controller` and `:action` are special, they map to the names of an action within a controller. Example route:
`get ‘:controller(/:action(/:id))’`

a request `/photos/show/1` is processed by this route, invoking `show` action by `PhotosController`. 1 is passed through `params[:id]`
#### Dynamic Segments
Anything other than `:controller` or `:action` is a part of params, as dynamic segments.
`get ‘:controller/:action/:id/:user_id’`

#### Static Segments
Any segment in the path not prepended by a colon is static:
`get ‘:controller/:action/:id/with_user/:user_id’`
responds to path `/photos/show/1/with_user/2`

**Query String** acts normally with non-resourceful routes. Query String passed as the final parameter in params. For the route:
`get ‘:controller/:action/:id’`
the path `/photos/show/1?user_id=2` will pass `user_id=2` as params to `show` action in `PhotosController`

#### Defining Defaults
You don’t need to explicitly use `:controller` and `:action` symbols in a route. Supplying them by default:
`get ‘photos/:id’, to: ‘photos#show’`

a path `/photos/12` will implicitly match to the `show` action from `PhotosController`

You can define other defaults in a route by supplying a hash to the :defaults option. Applies to non-dynamic segments too:
`get ‘photos/:id’, to: ‘photos#show’, defaults: { format: ‘jpg’ }`
matches path `photos/12` to show action of PhotosController, and set params[:format] to ‘jpg’

### Naming Routes
`get ‘exit’, to: ‘sessions#destroy’, as: :logout`
creates `logout_path` and `logout_url` as named helpers.

`logout_path` will return `/exit` path
