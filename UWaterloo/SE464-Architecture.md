# Software Architecture
- architecture is about communication, not developement
- it is the fundamental organization of a system, its components and relationships between them
- functional requirements are what it's supposed to do
- non functional is how it's supposed to be
- **conway's law**: the structure of software reflects the structure of the organization that built it
- **decomposition** is top down abstraction, breaking down a problem
- **architecture model**: artifact documenting design
- **architecture visualization**: way of depicting design decisions
- **architecture view**: subset of related design decisions

### 4+1 Architectural view
Describing a system from the point of view of different stakeholders
- development: classes involved, implementation
- logical: functionality
- physical: interacting components
- process: dynamic parts of the system behaviour
- +1, scenarios: explaining how the system works for various user case studies

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/4%2B1_Architectural_View_Model.svg/708px-4%2B1_Architectural_View_Model.svg.png"/>

### Architectural Styles
- purpose of architectural patterns is to understand how major parts of the system fit together and how messages and data flow through the system (structural concerns)
- **architectural styles** are named collections of design decisions, applicable in a given context for working around constraints

##### Architectural Patterns
- MVC
- three-tiered pattern
- Sense-compute-control

##### 1 Layered
- **connectors** are protocols of layer interaction
- each layer is a client to layers below, and provider to those above
- can have standardized layer interfaces
- can evolve different parts
- disadvantage: not universally applicable, extra performance overhead of communicating between layers
- **Client-server**

##### 2 Data Flow
**Batch Sequential** is a data-flow style
- programs are executed in an order, data is passed as an aggregate between them

**Pipe and Filter** style
- components are filters, connectors are pipes
- transforms data streams
- example is the unix philosophy, and composing programs together

##### 3 Shared Memory
**blackboard** style
- central data structure, accessed by multiple components

**rule-based style**
- parse user input as rule or query
  - rules are added, queries return knowledge
- rules modify the behaviour of the data store

##### 4 Interpreter
- lisp/scheme

##### 5 Implicit Invocation
- listeners register events and associate methods 
- **pub-sub** 
- **event-based**

##### 6 Peer-to-Peer style
- peers are independent components, own state and control thread
- connectors are network protocols
- data: messages

##### Recovering style
- syntactic clustering (static relationships among code)
- semantic clustering
  - all aspsects of a system's domain knowledge 
  - may require dynamic execution

### Architecture Modeling
- Architectural Elements: components connectors interfaces configurations rationale
- can model constraints on interactions (behavioural, concurrency)
- can model static and dynamic aspects
- model functional vs non-functional
- characteristics: ambiguity, accuracy/precision, views
- model based on viewpoint of a system: logical, physical, deployment, concurrency, behaviour

### UML
- component diagrams describe at higher level

### Security
Non functional properites: confidentiality, integrity, availaiblity

Principles:
- **Least Privilege**
- **Fail-safe Defaults** deny access
- **Economy of Mechanism** 
- **Complete Mediation** always check for permission on every access
- **open design** (no security through obscurity)
- [Chrome Security](https://queue.acm.org/detail.cfm?id=1556050)

### Layered Architectures
- MVC
- MVP takes it further, presenter is more testable than view
  - presenter glues model and view together, replacing the controller

- [examples](https://cs.uwaterloo.ca/~oadesina/slides/) 

### Dependency Injection
- **inversion of control**; a generic framework calls custom implemented routines
  - event-driven programming is implemented using IoC: custom code is only concerned with handling events, allowing the event loop to dispatch such events
- **dependency inversion principle** states that high-level and low-level modules should depend on the same interface 
  - want to bbe able to substitute different implementations without recompiling 
- **dependency injection** intends to decouple objects from client code such that the object can be changed to a different one without changing client code
  - injector has control, it calls the client to inject them
  - DI is how we acheive dependency inversion; it's some way an object to receive a concrete implementation of a low-level module without coupling the modules whatsoever (constructor or parameter injection)
  - so we don't want to couple to concretion but instead abstraction (be wary of `new`)

Guice (Juice)
- constructor injection
- lets us have compiled jars, connected together dynamically by Guice, allowing us to load different jar file dependencies based on user input at runtime. This means implementation can change without recompilation of the application

Motivation behind DI
- direct constructor calls in code means we cannot stub with fake objects during testing
  - it is not modular or testable
- factories decouple client and implementation classes, allowing proper testability
  - requires a global variable to hold the mock implementation, so no parallelization and test failure could affect other tests
  - DI is an alternative, that should reduce boilerplate, and brings visibility to dependencies through a graph

### Checker Framework
Java static analysis tool. Pluggable type systems all more expressiveness and allows for multiple type systems for differing needs
- can check for execution of user input

### Hints for Computer system design
- simplicity; working code is better than fast code
- don't hide power
- continuity; keep the API/interface constant
- hide implementation, plan to replace
- handle all cases, keep normal and worst case separate
- for speed, split resources for fairness, and use brute force over questionable invariants
