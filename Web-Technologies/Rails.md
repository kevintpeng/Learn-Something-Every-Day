# Rails
## Model and ActiveRecord
### 1 ActiveRecord
- Active Record is the model layer in MVC, represents data and logic.
- Allows creation of objects whose data is persistent.
#### Object Relational Mapping (ORM)
- How Active Record relates objects in a database, fast retrieval.
#### Active Record and ORM
- represents models and their data
- represents associations between models
- represent inheritance and hierarchy through related models

### 2 Conventions
ORM frameworks follow conventions over configuration, standardization.
#### Naming
- pluralize class name to get database table name 
- class: Article, table: articles
- Foreign keys: singularizedname_id // relating object to others, points to primary key in other table
- Primary keys: integer column named id //auto generated identification for an object

### 3 Creating Active Record Models
- subclass the ActiveRecord::Base 
- allows users to map attributes of the subclass directly to columns of the database in object oriented fashion.

### 5 CRUD: Database Operations
#### Create:
`user = User.create(name: “kevin”, job: “programmer”)`

`#new` creates a new unsaved instance

#### Read:
- `#all` returns collection
- `#first` returns first
- `#find_by(attribute: value) // returns first instance`
- `#where(attribute: value, attribute: value) // returns all` 
- `#order(created_at: :desc) //sorts collection by date`

#### Update:
- `#save` saves to database
- `update` 

#### Delete
- `#destroy`

### 6 Validation: 
in the class file, `validates :name, presence: true`

`#valid?` checks validity of instance of data
only validates when using create, save, update
```ruby
class Person < ActiveRecord::Base
  validates :name, presence: true
end
```
```ruby
>> p = Person.new
# => #<Person id: nil, name: nil>
>> p.errors.messages
# => {}
 
>> p.valid?
# => false
>> p.errors.messages
# => {name:["can't be blank"]}
```
#### Helpers 
`validates :terms_of_service, acceptance: true`

`validates_associated :subclass calls valid?` on associated objects

`presence: true`

`uniqueness: true //searches model table for existed record`

`format: { with: /regex/, message: “custom error message, optional” }`

### 7 Callbacks
Active Record callbacks attach code to a certain event in the life cycle.
#### 7.1 Object Life Cycle
Objects are created, updated and destroyed.

Callbacks allow logic to be executed before or after alterations to an object’s state.
#### 7.2 Callback Overview
in model class, 
```ruby
before_validation :function // def function within class
protected
def function
        self.name = self.name.downcase
end
```
#### 7.3.1 Creating an Object
```
before_validation
after_validation
before_save
around_save
before_create
around_create
after_create
after_save
after_commit/after_rollback
```
#### 7.3.2 Updating an Object
```
before_validation
after_validation
before_save
around_save
before_update
around_update
after_update
after_save
after_commit/after_rollback
```
#### 7.3.3 Destroying an Object
```
before_destroy
around_destroy
after_destroy
after_commit/after_rollback
```
#### Conditional Callbacks
```ruby
class Order < ActiveRecord::Base
  before_save :normalize_card_number, if: :paid_with_card?
end
Callback Classes
class PictureFileCallbacks
  def after_destroy(picture_file)
    if File.exist?(picture_file.filepath)
      File.delete(picture_file.filepath)
    end
  end
end
```
Then called by the model:
```ruby
class PictureFile < ActiveRecord::Base
  after_destroy PictureFileCallbacks.new
end
```
### 8 Migrations
Domain-specific language for maintaining the database schema called migrations. Migrations are executed against an Active Record database using rake.

Allows alteration of database schema over time

`$ bin/rails generate migration migration_name`

[For specifics in writing migrations](http://edgeguides.rubyonrails.org/active_record_migrations.html)
#### Changing Existing Migrations
`rake db:rollback` will revert changes so you can edit. Preferably create new migrations to fix changes.
#### Schema Dumping
Schema represents the current state of the database and should not be edited.

## Layouts And Views
### 2 Creating Responses
Controller handles requests in rails.
Three ways to create HTTP response:
    Call render to create a full response for the browser
    Call redirect_to to send an HTTP redirect status to browser
    Call head to create a response consisting solely of HTTP headers for the browser
Defaults
with controller “BookController” and “resources :books” in routes, then a view is generated as “books”
Using render
in controller under def update,     render “edit”     //will render a template associated with a different action, in this case edit’s view
only one render can be done in general
render options
content_type:
layout: false    // no layout
layout: “special_layout”     // different layout from app/views/layouts/
location:
status:
redirect_to
Send a new request for a different URL.
redirect_to :back     // special syntax for return to previous page

3 Structuring Layouts
When rails renders a view as a response, combines view with layout.
Within a layout, three tools combined to form response:
Asset tags
yield and content_for
Partials
Asset Tag Helpers
provide methods for generating HTML that link views to feeds, javascript, stylesheets, images, video, audio
auto_discovery_link_tag
javascript_include_tag
stylesheet_link_tag
image_tag
video_tag
audio_tag

yield
Within a layout, <%=yield%> identifies where the view should be inserted.
content_for Method
content_for method allows insertion into named yield blocks
look up more for layouts containing distinct regions like sidebars and footers and should get their own blocks of content inserted.
Using Partials
for rendering pieces as their own file
<%= render “menu”%>
will find the file menu.html.erb in the current directory and render at the point in the view.
Asset Pipeline
Concatenates assets, reducing the number of requests made by the browser.
By default concatenates all css files in the asset pipeline.

Routing and HTTP
A typical URL containing a query string is as follows:
http://example.com/over/there?name=ferret
a query string could look like this too:
field1=value1&field2=value2&field3=value3…
ALL HTTP requests go through the router first. Rails Router recognizes URLs and dispatches them to a controller’s action. It generates paths and URLs avoiding the need to hardcode strings in views.
View triggers HTTP method, asks router to match a request to a controller method, the request is dispatched to the controller method with params.
Example:
HTTP REQUEST:     GET /patients/17
MATCHING ROUTE:    get ‘/patients/:id’, to: ‘patients#show’
Above is a basic example of non-resourceful routing (covered later)

Resource Routing
Resources quickly declare all common routes for a given resourceful controller.
Syntax in router:     resources :photos

HTTP Verb | Path |Controller#Action | Used for
--- | --- | --- | ---
GET | /photos |photos#index | display a list of all photos
GET | /photos/new | photos#new | return an HTML form for creating a new photo
POST | /photos | photos#create | create a new photo
GET | /photos/:id | photos#show | display a specific photo
GET | /photos/:id/edit | photos#edit | return an HTML form for editing a photo
PATCH/PUT | /photos/:id | photos#update | update a specific photo
DELETE | /photos/:id | photos#destroy | delete a specific photo

Rails routes read from top to bottom, terminating the lookup at the first match.

Path and URL Helpers
Using resources :photos will add helpers to the controller:
photos_path returns /photos
new_photo_path returns /photos/new
edit_photo_path(:id) returns /photos/:id/edit (for instance, edit_photo_path(10)returns /photos/10/edit)
photo_path(:id) returns /photos/:id (for instance, photo_path(10) returns /photos/10)
Singular resources are looked up by clients without referencing ID. (think profile) They are defined as so:     
resource :photo    (not resources :photos)
get ‘profile’, to :show        is equivalent to         
get ‘profile’, to: ‘users#show’

Nested Resources
In router,
resources :magazines do
    resources :ads
end

Shallow Nesting
Resources should never be nested more than 1 level deep. To avoid such hierarchies, shallow nesting is shorthand for nesting resources but not their actions. 
resources :articles do
    resources :comments, shallow: true
end
Equivalent to:
resources :articles do
  resources :comments, only: [:index, :new, :create]
end
resources :comments, only: [:show, :edit, :update, :destroy]

Routing concerns
To define blocks of resources that will be reused inside other resources.
concern :commentable do
  resources :comments
end
# then can be reused modularly in other resources
resources :messages, concerns: :commentable

Equivalent to:
resources :messages do
  resources :comments
end

Adding More RESTful Actions
To add a member route, just add a member block into the resource block:
resources :photos do
  member do
    get 'preview'
  end
end
This will recognize /photos/1/preview with GET, and route to the preview action of PhotosController, with the resource id value passed in params[:id]. It will also create the preview_photo_url and preview_photo_path helpers.

To add a collection route, 
resources :photos do
    collection do
        get ‘search’
    end
end
This will recognize /photos/search with GET and route to the search action in the PhotosController

Non-Resourceful Routes
Rails can route arbitrary URLs to actions.
Bound Parameters 
Regular routes are series of symbols that Rails maps to parts of an HTTP request. 
:controller and :action are special, they map to the names of an action within a controller. Example route:
get ‘:controller(/:action(/:id))’
a request /photos/show/1 is processed by this route, invoking show action by PhotosController. 1 is passed through params[:id]
Dynamic Segments
Anything other than :controller or :action is a part of params, as dynamic segments.
get ‘:controller/:action/:id/:user_id’
Static Segments
Any segment in the path not prepended by a colon is static:
get ‘:controller/:action/:id/with_user/:user_id’
responds to path /photos/show/1/with_user/2
Query String acts normally with non-resourceful routes. Query String passed as the final parameter in params. For the route:
get ‘:controller/:action/:id’
the path /photos/show/1?user_id=2 will pass user_id=2 as params to show action in PhotosController
Defining Defaults
You don’t need to explicitly use :controller and :action symbols in a route. Supplying them by default:
get ‘photos/:id’, to: ‘photos#show’
a path /photos/12 will implicitly match to the show action from PhotosController
You can define other defaults in a route by supplying a hash to the :defaults option. Applies to non-dynamic segments too:
get ‘photos/:id’, to: ‘photos#show’, defaults: { format: ‘jpg’ }
matches path photos/12 to show action of PhotosController, and set params[:format] to ‘jpg’
Naming Routes
get ‘exit’, to: ‘sessions#destroy’, as: :logout
creates logout_path and logout_url as named helpers.
logout_path will return /exit path

Controller
After routing determines which controller to use for a request, the controller makes sense of the request and produces an appropriate output.
After routing matches a request, a new instance of that controller runs the method with the same name as :action
Methods in the controller, not intended to be callable as actions should be private or protected.
Naming Convention is to pluralize the last word in name: SiteAdminsController
Parameters
All parameters are available through the params hash, and passed using the following ways:
Query String Parameters
    A hash of information sent through the URL.
HTTP POST data Parameters
Information from things like forms, sent as a part of a HTTP POST request.


Forms
abstracts out the process of rewriting forms
helper: = form_tag do
        Form Content
-end
form_tag “/search”, method: “get” do
    label_tag :q, “Search for:”
    text_field_tag :q
    submint_tag “Search”
end

form_tag takes 2 hashes of options: the path built from url parameters, and options hash.
form_for @model, url: {action: “create”}, html: {“class: “nifty_form} do |f|
Creates a specific form for an activerecord, with f.submit

All the elements of the form are passed in the query string as params when submitted, with key being the symbol passed and value being received in the input.

Using form_for, the keys in params edit the model’s attributes.

API-only Applications
Rails backend shared between web app and other native apps
API client delivers HTML with JavaScript that consumes a JSON API
`rails new my_api --api` generates a subset of normal project
    Use ActionController:API instead of Base, and skips views, helpers, assets for resources

Active Support Core Extensions
Active support is rails component for ruby language extensions, utilities, transversal stuff
`require ‘active_support’ `
