# Domain Specific Language
A programming language specialized to a particular application domain (fields of applications). HTML is an example of a DSL for the domain of web pages.  The language is dedecated to:
- a particular problem domain
- problem representation
- solution technique

### Examples
SQL, TeX, CSS, XML variants...

### When is it good to use a DSL?
1. Targeting Domain Experts (TeX targets academia, easier than a Java API for typography, Excel macros are powerful without programming knowledge)
2. Domain Lends Itself to an Idiom, expressed in a simple syntax (think SQL)
3. You can eliminate Boilerplate 

### Internal vs External 
**Internal DSL** is embedded in a programming language, and its structure is dependent on the parent language. Easier to implement.

**External DSL** is a separate langauge with the particular domain in mind. Gives more syntax flexibility but harder to implement.
