# Statics -- [source](http://misko.hevery.com/2008/12/15/static-methods-are-death-to-testability/)
Static methods are procedural code. In object-orient programming, mixing in procedural code can make it difficult to test
- dependencies are other objects that are passed in to an object, which makes calls on its dependencies
- in unit testing, dependencies can be mocked so that parts of appications can be instantiated without needing to always test full integration with all its dependencies
- calls to static methods cannot be mocked because they are not instance methods so there is no underlying object to mock
  - once a `new` operator is called directly, that object cannot be mocked in testing
- the **factory method design pattern** is one common way to avoid this, when instantiating objects in code
  - to be clear, this is where a factory is an object, with an instance method `Create`. Not a static method that acts as a factory
- **dependency injection** is the pattern used to break static dependencies in objects
