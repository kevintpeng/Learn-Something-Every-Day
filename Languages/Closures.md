# Closures
- Continuations are a feature of languages that allow state to persist.
- In functional programming, continuation-passing style (CPS) is a style of programming in which control is passed explicitly in the form of a continuation

example:
```scheme
; Return a list of all books with at least THRESHOLD copies sold.
(define (best-selling-books threshold)
  (filter
    (lambda (book)
      (>= (book-sales book) threshold))
    book-list))
```
