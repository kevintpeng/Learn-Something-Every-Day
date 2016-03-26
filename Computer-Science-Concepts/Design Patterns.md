# Software Engineering Design Patterns
A design pattern is a general reusable solution to a given common problem. It is not a specific implementation of something, but rather a description or template for how to solve a problem. Patterns are applicable in many situations.

## Types of Patterns
Patterns can reside in the domain of modules and at higher levels in architectural patterns. Some types of patterns:
- Structural patterns, concerning high level structure of a system.
- Computational patterns, identifying key computations.
- Algorithm strategy patterns, concerning high level strategies describing how to exploit application characteristic on a computation platform.
- Implementation strategy patterns
- Execution patterns 

## Factory Method
Factory pattern creates an object from a set of similar classes based on some parameters, usually a string. 
```java 
MessageDigest md = MessageDigest.getInstance("SHA-1");
```
Creates an object that calculates the message digest based on the SHA-1 algorithm. Can be changed to `MD5` for a different algorithm.

## Abstract Factory
The Factory pattern only affects one class, while the Abstract Factory Pattern affects many classes:
```java
UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
```
Now every Swing class being loaded is affected.

## Singleton
One of the most dangerous design pattern. It guarantees that only one instance of a class exists. Possible applications are a printer manager or database connection manager. Useful when access to limited resources needs to be controlled.

## Iterator
Iterator pattern is trivial: it allows you to to go through a list of objects.

## Command 
Command pattern is a logic structure of code, where the code progresses based on commands recieved.

## Observer
Very popular, the observer pattern

## Object Oriented Design Patterns
Structural patterns that shows relationships and interactions between classes or objects, without specifying the final application/classes. See [object oriented principles](Object Oriented Principles.md).
