# Make and Makefiles
Automated build tool, for compiling source code. `make` looks for a file named `makefile` in your directory and executes it.

### Basics
instead of typing `gcc -o hellomake hellomake.c hellofunc.c -I.` to compile a c++ project, create `makefile`:
```
hellomake: hellomake.c hellofunc.c
     gcc -o hellomake hellomake.c hellofunc.c -I.
```
Finds the respective dependencies and runs a command.

[source](http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/)
