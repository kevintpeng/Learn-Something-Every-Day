# Modules
A way of grouping methods, classes and constants together.
- provides a namespace, preventing name clashes
- implement the mixin facility

### Namespaces
Allow the creation of libraries of related routines.
- break this library into multiple files
  - often code will be organized by classes (one class per file)
  - sometimes things don't naturally fit into a class

### require
Loads the given `name`, returns true if successful, false if already loaded, error if it doesn't load.
- if the filename does not resolve to an absolute path, it will be searched for in the directories listed in `$LOAD_PATH` 
