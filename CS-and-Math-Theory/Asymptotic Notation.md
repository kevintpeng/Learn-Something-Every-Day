# Asymptotic Notation
Describes algorithm efficiency in terms of their "main terms".

For functions f,g: N->R,
- f(n) = O(g(n)) iff there exists a positive constant c in Reals and a constant n0 in Naturals s.t. |f(n)| ≤ c|g(n)| for all n ≥ n0. (There's a constant c that makes g(n) grow as fast as any given f(n))
- f(n) = Ω(g(n)) iff g(n) = O(f(n))
  - c•g(n) ≤ |f(n)|
- f(n) = Θ(g(n)) iff f(n) = O(g(n)) and f(n) = Ω(g(n)). 
  - if f(n) = Θ(n), linear, there exists c1 and c2 s.t. c1•n ≤ f(n) ≤ c2•n for all n ≥ n0.
