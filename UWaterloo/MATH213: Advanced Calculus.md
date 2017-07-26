# Math 213
### Summary
- differential equations contain derivatives of a dependent variable; the solution is not a value, but rather a function or class of functions. We often need initial conditions to find a specific function solution
- separable differential equations allow us to solve them analytically, where we separate x's and y's to opposite sides of the equations and perform implicit differentiation (recall MATH 119)
- we can model many natural phenomena with differential equations exponential model
- population can be modelled simply with an exponential model, but more effectively as a differential equation. We can say dN/dt = r N (1 - N/K), "Logistic differential equation" where 1 N/K dampens growth at the population limit
- **homogeneous equations** can be transformed to separable equations with a substitution
- **boundary conditions**? -- TODO
- **ordinary differential equations** don't involve partial derivatives (so single independent variable) 
- we want analytical solutions, and can avoid numerical solutions if the equation is a linear ordinary differential equation (ODE) with constant coefficients: d<sup>n</sup>/dt<sup>n</sup>y(t) + a<sub>n-1</sub>d<sup>n-1</sup>/dt<sup>n-1</sup>y(t) + ... 
- then when solving a differential equation, we want to find some function that satisfies the expression, which can be solved given the initial condition, and by finding a function of the form `y(t) = c•e^(mt)` (since it has a nice derivative allowing us to find a characteristic equation, often polynomial). Then, using each root and initial conditions, we can find an equation for each unknown constant 
- let Q(D) is a polynomial of differentials with coefficients, and when multiplied with some y(t), we get a ODE Q(D)y(t) = P(D)f(t), and in this course, we solve for y(t) with a given P(D)
- Laplast Transform allows us to solve differential equations, by solving an algebraic equation in the Laplast domain

### Separable ODE
Goal is to separate functions and derivatives of x and y to either side of the equation, dy/dx(expression of y) = f(x), then take the integral of both sides

### Exact ODE
Uncommon, but we want to find a substitution u(x,y) = C 

### First-Order Linear ODE (variable coefficients)

### Nth-Order Linear ODE (Homogeneous)

### Nth-Order Linear ODE (Homogeneous with constant coefficients)

### [Textbook](http://users.math.msu.edu/users/gnagy/teaching/ode.pdf)
Ordinary Differential equations are ones where the unknown function depends on a single independent variable t
- order of a differential equation is the highest derivative 
- linear differential equations are first order ODE on the unknown y is y'(t) = f)t, y(t)), where f is given and y' = dy/dt (the differential). Then the equation is **linear** iff f(t,y) = a(t)y + b(t). But since we only care about constant coefficients for now, it is y' = ay + b
- now let's look at solving differential equations; integrating on both sides does not work
  - for y' = 2y + 3, integrating is not enough to find a solution y, we still need to find a **primative** of y
  - we have only rewritten the original equation as an integral equation
- the linear differential equation y' = ay + b has infinitely many solutions: y(t) = ce<sup>mt</sup> - b/a, c in REALS
- this infinitely many solutions is called the **general solution** of the differential equation
  - there are infinitely many solutions, one solution fo

### Introduction
Studying linear, time-invariant dynamic systems using differential equations  
- **differential equations** contain derivatives of some dependent variable with respect to an independent variable
- we can use integration (and techniques like partial fraction decomposition) to simplify and solve for values
- for differential equation: dx/dt = ax(t) - bx(t)^2, when we solve for x(t) we get the **Logistic Equation** (recall that this flattens any real values to a range of (0,1))
  - "peak oil" theory assumes that the cumulative production of resources satisfies the logistic equation (in other words, the first derivative is the logistic curve)
- **boundary value problem** is a differential equation with a sert of additional constraints called boundary conditions
- linear differential equations contain no constant terms (otherwise called affine)
  - only able to perform analytical solutions when coefficients are constant
  - principle of superposition greatly simplifies analysis

### Lecture 2
A general solution for an ODE is an expression for y(t) satisfying the equation and containing n "arbitrary constants/constants of integration"
- a set of n initial conditions determines values of these arbitrary constants
- the goal is to find the general solution of the eq, and plug in the initial conditions to evaluate the arbitrary constants 
- start by finding an **auxiliary equation** y<sub>c</sub>(t) = 0, also called the complementary solution
- then, we'll find a particular solution
- y˜(t) = yc(t) + yp(t)
- Q(D)(yc(t) + yp(t)) = Q(D)yc(t) + Q(D)yp(t) = 0 + f(t)

# Laplace Transforms
Helps us solve differential equations. Transform takes you from one set of functions to another set of functions. f(t) -> F(s), different domains.
- **Laplace Transform** is a means of representing a function as a weighted sum of exponentials
  - the transform is applying weights to exponentials
  - F(s) := L{f(t)} := indefinite integral of f(t)e^(-st)dt 
  - since it's an indefinite integral, it will only be defined if the integral converges
- If all of our signals were exponentials y=e^st, then differentiation is just multiplication.
- If not, it would be best to express signals as linear combinations of exponentials

Some known Laplace transforms:
- L{ 1 } = 1/s
- L{e^at} = 1/(a-s) only if it converges
- L{sin at} = a/(s^2+a^2) *(by using integration by parts)*
- L{cos at} = s/(s^2 + a^2) *(by the second property of laplace transforms on sin at)*
- L{ t } = 1/s^2 *by derivative property of laplace transforms*
- L{ t^n } = n!/s^(n+1)
- L{ u<sub>c</sub>(t)f(t-c) } = e^(-sc) L{ f(t) } for the unit step function, where 0 until c, then 1
  - *this will be useful for describing piecewise functions (think back to when we learned about compositions of unit step functions)*
  - the unit step function can act as an offset, since it zeroes out a function until `c`
  
Properties of Laplace using notation L{ f(t) } = F(t):

1. L{ c1f(t) + c2g(t) } = L{c1f(t)} + L{c2g(t)} by properties of integrals, the Laplace transform is a linear operator
1. L{ f(ct) } = 1/c F(s/c) *time-scaling*
1. L{ e^(at)f(t) } = F(s-a) *translates the transform*
1. L{ &mu;<sub>c</sub>(t) f(t-c) } = e^(-cs) F(s)
1. L{ t f(t) } = - d/ds F(s)
1. L{f'(t)} = s • L{f(t)} - f(0) by integration by parts. This turns derivatives into multiplication.
  - L{f''(t)} = s • L{f'(t)} - f'(0) = s^2 L{ f(t) } - s f(0) - f'(0)
  - L{f<sup>(k)</sup>(t)} = s^k L{y} - s^(k-1)f(0) - s^(k-2)f'(0) + ... *(this is called "shifting transform")*
  - this gives us a powerful tool to solve differential equations: **converting them to algebraic equations**
  
The transform can be inverted by means of the inversion integral: f(t) = 1/(2π • j) integral of F(s) e^st from &sigma; - j∞ to &sigma; + j∞ *so somehow, by taking the integral over the imaginary range, we get the inverse laplace transform operator*
- this is a "contour integral" on the complex plane, the contour of integration, the straight line Re(s) = &sigma; must lie within the Radius of Convergence of F(s)
- given that an integral is just a sum, the inversion formula shows that f(t) is a sum of exponentials e^st, weighted by F(s)

### Laplace for differential equations
So the reason that Laplace transforms help us solve differential equations is because we apply a one-to-one transform on both sides of an equation
```
y'' + 5y' + 6y = 0, y(0) = 2, y'(0) = 3
L{y''} + 5L{y'} + 6L{y} = L{0}
s^2 L{y} - s(2) - 3 + 5(s L{y} - 2) + 6L{y} = 0
s^2L{y} + 5s L{y} + 6L{y} - 2s - 13 = 0
L{y}(s^2+5s+6) -2s -13 = 0
L{y}(s+3)(s+2) = 2s + 13
L{y} = (2s+13)/((s+3)(s+2))
y = L^-1{(2s+13)/((s+3)(s+2))}  partial fraction expansion now
  = L^-1{ A/(s+3) + B/(s+2)
```

### Signals and Systems
Essential some function or transformation. Properties of systems:

1. CT, DT, hybrid describe types of in/out functions
  - often represented by difference equations
2. Memoryless (pure function) vs. Dynamic (depends on state)
3. Causality, dependent only on prior values of the input with respect to time
4. Multivariable vs. Scalar
5. **Linearity**, if the input is a linear combination of signals, then the output is a linear combination of their individual responses
6. **Time Invariance**, doesn't change with time (response can be horizontally shifted without change shape)
7. Lumped vs. distributed-parameter systems
  - lumped is one which signals only depend on the var `t`
  - distributed is a system which depends on other indep vars

### Zero-state and Zero-input
We'll look at linear, time-invariant, lumped-parameter systems
- model by linear ODE with constant coefficents, Q(D)y(t) = P(D)f(t), order n with some initial values
- we care about t≥0
- if system is **dynamic**, then we also have to look at the negative values of t
- let's decompose f into the + and - parts, where f<sub>-</sub>(t) into a sum of functions whose value is zero for all non-negative t
- *I guess we can find a unique solution (input) to Q(D)y(t) = P(D)F<sub>-</sub>(t) since we have initial conditions*
- **zero-input response** is y<sub>-</sub>(t), because it's the response if f(t) is "turned off" at t=0
- by causality we can form the same equation for inputs, y(t) = y<sub>-</sub>(t) + y<sub>+</sub>(t)
- **zero-state response** is y<sub>+</sub>(t)
- *note, even for t≥0 , the zero-input and zero-state responses are generally not part of the solution y(t)*
- wikipedia describes zero state response as the result only from external input or driving functions, not from the initial state.

The big conclusion from this section is that we're studying **zero-input response**. It tells us all we need to know about the system's dynamics

### Convolution
**Convolution** of (f * g)(t) is the integral from 0 to t of f(t-&tau;)g(&tau;)d&tau;
- e.g. f(t) = sint and g(t) = cost and requires integral solution methods
- Theorem states: L{ (f * g)(t) } = F(s)G(s), the products of laplace transforms
- again, (f * g)(t) = L^-1{ F(s)G(s) }
- *notice that we have the convolution as an integral, dependent on t. The convolution is a function of t, and so &tau; is just used to sum across 0 to t.* 
- e^st as input to a system gets multiplied by some constant y(0), which turns out to be H(s), our **transfer function** by the convolution integral
- *we'll look at the poles of the response, because the sort of characterize the transfer function*
- RC circuit system changes the potential difference after passing through the circuit, and we can express the voltages through a differential equation
  - the transfer function is the transform of the impulse response
  - impulse response is a zero-state response so set the initial conditions to zero
  - *I think in general, we'll treat initial values as zero in this course, or at least that seems like a fair assumption if we're stuck*
- **first order transfer functions** have one pole
- **standard first order system** is H(s) = K/(s&Tau; + 1), K, &tau; positive integers
- the steady-state value of the step response is K, the **dc gain** of the transfer function
- **transient term** is the part of the ODE that tends to 0 as t->infinity
  - it turns out that the closer the pole is to zero, the slower the transient decays
- tau determines the rate of decay of the transient term e^(-t/&tau;), called **time constant**
- poles are at complex values, and at the pole of a function f(z), f(z) -> ∞ as z->a, for pole `a`
  - the real part determines the rate of decay of the amplitude of osillation, imaginary part determines the angular frequency of the oscillations
  - the modulus of the pole is the hypotenuse of the complex number. As it increases, response speeds up
  - as the angle of the complex number decreases, the response is less oscillatory
  - *the further the poles are from the origin, the "faster" the response, and the closer they are to the real axis, the less oscillatory the response*

### Frequency Responses of LTI systems
Previously, we transform problems in analysis of LTI systems into Laplace to be solved algebraically
- we can transform problems to the "Frequency domain" by looking at how LTI systems respond to sinusoids
- sometimes we can look at poles and zeroes and understand the system
- we know response to a two-sided exponential input e^st is transfer function H(s)•e^st
- for sinusoids, it is the case where `s` is purely imanginary by euler's formula, so e^(j&omega;t)
- the **frequency response** of a system is H(j&omega;), s = j&omega; or s is a sinusoid
- if instead the input is of the form e^jwt unitstep(t), then it may provoke transients that are not of the form e^jwt
- if H(s) is stable, then in "steady-state" (neglecting transient terms which decay to 0) the output will be H(jw)e^jwt unitstep(t)

https://www.youtube.com/playlist?list=PLUMWjy5jgHK3j74Z5Tq6Tso1fSfVWZC8L

### Bode Plots
- if operator s is a value that causes the transfer function to approach infinity, it's called a **pole**
- **zero** if it approaches 0

### Fourier Series
Sinusoids are easier to analyze because of the frequency response and the fact that it is only ever changed in amplitude or horizontal translations
- we want to decompose signals into sinusoids
- given a sinusoidal signal, we can often express it as an infinite sum of sinusoids
- **fourier series** are infinite sums of sinusoids
  - think of as coefficients tell us how much of each frequency is in our function
  - definite integrals of sin and cos from 0 to 2 pi is 0
  - definite integral from 0 to 2pi of sintcost = 0
  - definite integral from 0 to 2pi of sin(mt) sin(nt) = 0 when m ≠ n
  - definite integral from 0 to 2pi of sin^2(mt) = pi, m non zero
  - definite integral from 0 to 2pi of cos^2(mt) = pi, m non zero
- we can use these facts to evaulate fourier coefficients
  - first term in a fourier series, every term in the infinte series will be zero EXCEPT the a<sub>0</sub> term, the first constant term in the fourier series
  - so definite integral of a fourier series is a0 • 2pi, or the average value of a function f over the interval [0, 2pi]
  - we can find the nth coefficent `an` by multiplying both sides by cos(nt) 
  - nth coefficient `bn` by multiplying both sides by sin(nt)
- it turns out the infinite set of sinusoids constitutes an orthogonal basis of a vector space
  - vector space describes the set of possible vectors, a basis is a set of vectors that can express any vector in the vector space as a linear combination of the basis vectors
  - an orthogonal basis just means that all the basis vector are orthogonal to each other
- we will take its projection onto each of them
- a funciton is **periodic** with period T if for all t, f(t + T) = f(t)
  - try to represent it as a superposition of sinusoidal functions `e^(j2pi n t / T)`, n is an integer
- such functions are "eigenvectors" of linear systems (scalar multiple after being transformed by the system)
- **inner product** is an algebraic operation
