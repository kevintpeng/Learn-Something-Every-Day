# Dependency Injection
In OOP, an injection is the passing of a dependency to the dependent object (client) as opposed constructing it in the client. It is one form of Inversion of Control; the client cannot call the injector code, it is the injecting code that constructs the dependency and calls the client (library).

### Inversion of Control
Design principle used to increase modularity by decoupling execution from implementation and focusing modules for a specific task.

Dependency Injection implements inversion control through composition over inheritance. This means that the actual implementation of an interface in the code base can change without changing the client. It also allows mocks to be passed into dependent objects for easier testing.

### The injector
Constructs dependencies and often constructs the client itself too. In Java, Spring and Guice are dependency injection frameworks that act as the injector.
