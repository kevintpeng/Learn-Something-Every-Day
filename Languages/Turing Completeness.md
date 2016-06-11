# Language Turing Completeness
A programming language is turing complete if it is in the same [computational class](http://esolangs.org/wiki/Computational_class) as a Turing Machine.

In general, for an imperative language to be Turing-complete, it needs:
1. A form of conditional repetition or conditional jump (e.g., while, if+goto)
2. A way to read and write some form of storage (e.g., variables, tape)

For a lambda-calculus–based functional language to be TC, it needs:
1. The ability to abstract functions over arguments (e.g., lambda abstraction, quotation)
2. The ability to apply functions to arguments (e.g., reduction)
