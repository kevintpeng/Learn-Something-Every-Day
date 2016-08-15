# Compilation
Source code -> Lexical Analysis -> Parsing -> Semantic Analysis

## Lexical Analysis
Lexicon is the vocabulary of a language. Lexical analysis is the process of separating a stream of characters into tokens, performed by a **lexer**. **Tokens** are any defined words for a programming language
- scans one character at a time, look ahead character determine what kind of token to read and when it ends
- this get trickier though, because reading an `i` doesn't tell us if it's `if` or an identifier

### Lexer Generator
- **lexer generator** creates a more efficient tokenizer automatically from a lexical specification
  - input to the lexer generator description of the tokens, priority and action
  - outputs a lexer, matching the spec and efficient in linear time

How do we break text up into tokens and tokenize efficiently in O(1)? Regular Expressions!
- programming languages can often be described with regular expressions
  - Regular expression R describes a set of strings `L(R)`: L is the language defined by R
  - we can define each token with a regex
- Lexer generators support abbreviations (like aliases) that are not recursive
- Regex alone aren't enough; need rule for choosing
  - often longest matching token wins, and ties resolved by priority
  
Spec: 
- input to lexer generator a list of regex in order of priority, with associated action for each Regex (generates appropriate kind of token)
- outputs a program that reads an inputs stream and tokenizes, reporting lexical errors
- [ANTLR](http://www.antlr.org/) is a powerful parser generator, with a specialized language for describing lexer grammar
- Lexer states allow conditioning on lexer state, helping with long tokens like multiline comments
