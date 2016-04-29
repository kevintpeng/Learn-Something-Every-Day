# Testing
Rails testing has serveral options: MiniTest, RSpec, Test::Unit, Cucumber. Test Frameworks make it easier to write and maintain tests. [Rake](Rake.md) provides `rake test` and other variations for automated testing.

Example Gemfile for test environment:
```ruby
group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end
```
### MiniTest
Testing Framework in Ruby's vast Standard Library. Faster than RSpec by running tests in parallel. Written more like Ruby code.

Used for unit testing in rails. ActiveRecord::TestCase inherits MiniTest::Test. Automatically generated in Rails for each model.
```ruby
class TruthTest < MiniTest::Unit::TestCase
  def test_truth
    assert true
  end
end
```
Checks truth by each `assert` statement. 
In MiniTest this is done with assertions that will test the object by assert something about it. Take this example of a Post model test.
```ruby
post = Post.create(title: 'Post title')
# post should be valid
assert post.valid?
```
Here we are creating a post object and checking if it is valid to ensure that it got created.

### RSpec
One of the built-in ruby testing frameworks. Run test cases in Rails with `bin/rspec` (reqiures being initialized). 
- Popular, but requires learning a full DSL and is slower than MiniTest counterpart
- Less code need because of DSL (and more readable)
- Good for running individual tests
```ruby
require 'rspec'
describe "Truth" do
  it "should be true" do
    true.should == true
  end
end
```

### Rails Fixture Testing
Built-in to ActiveRecord, Fixtures let you test the ActiveRecords themselves (testing on the database) by populating the testing database with sample data (in yaml format). 

- I always test my validations as these are important to the health of your application, you don't want an accidental deletion or typo to ruin your application.
- If you get an error in your application, before fixing it in the code, first write a test (that will fail) and then when you fix it, the test will pass.
- Test any callbacks such as `before_create` to ensure that your data is being generated as you expected.
- Test any third party Gems that your models rely on. You never know when a new version of a Gem will do things differently or break your application.

### Testing Controller and Views (Functional Testing)
Uses `ActionController::TestCase < ActiveSupport::TestCase < MiniTest::Test`. Also MiniTest! Introduces more `assert`s like `assert_response` for http responses.

Can be used to directly test http requests using the http VERBS:
```ruby
test "should create article" do
  assert_difference('Article.count') do
    post :create, article: {title: 'Some title'}
  end
 
  assert_redirected_to article_path(assigns(:article))
end
```

Views can be tested using `assert_select` to verify HTML content on page:
```ruby 
assert_select 'title', "Welcome to Rails Testing Guide"
```
`assert_select(selector, [equality], [message])` ensures that the equality condition is met on the selected elements through the selector. The selector may be a CSS selector expression (String) or an expression with substitution values.

`assert_select(element, selector, [equality], [message])` ensures that the equality condition is met on all the selected elements through the selector starting from the element (instance of Nokogiri::XML::Node or Nokogiri::XML::NodeSet) and its descendants.

### Integration Testing
Tests interaction among controllers. Test work flow for the application. In `test/integration` folder. 

From `ActionDispatch::IntegrationTest < ActiveSupport::TestCase`.

- [source: Comparing MiniTest to other frameworks](https://speakerdeck.com/ahawkins/bow-before-minitest)
- [source: Rails testing guide](http://guides.rubyonrails.org/testing.html)
