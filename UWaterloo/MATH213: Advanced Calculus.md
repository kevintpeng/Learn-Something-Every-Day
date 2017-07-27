# Math 213: Introduction to Control Systems and Differential Equations
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

### Part 3: Laplace for differential equations
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

### Part 4-1: Signals and Systems
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

### Part 4-2: Zero-state and Zero-input
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

### Part 4-3: Convolution
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
  - poles to the right of the imaginary axis (positive real part) give rise to growing exponentials (not stable)
  - *we're using complex numbers so that we have a nice "vector" almost of information, holding both the frequency and the amplitude of a sinusoid in one number* 
  - **stable** rational transfer function if all poles lie strictly to the left of the imaginary axis (negative)
- a single input single output (SISO) system is bounded input bounded output (BIBO) stable iff its transfer function is both stable and "proper" (degree of numerator doesn't exceep the denominator)
  - by bounded, we're looking at a function s.t. |f(t)| ≤ some M
  
The big conclusion of this section is that we get a lot of information about a system's transient (think oscillation part) by looking at its poles on the complex plane

### Part 5-1: Frequency Responses of LTI systems
Previously, we transform problems in analysis of LTI systems into Laplace to be solved algebraically
- we can transform problems to the "Frequency domain" by looking at how LTI systems respond to sinusoids
  - *the frequency domain on the complex plane has a bunch discrete points on it, which each represent some sinusoid. This is cool because the inverse laplace takes us from the frequency domain (complex numbers) to the time domain (real numbers), which is an integral (summation) over a bunch of points in the frequency domain. But really what this physically means is that we're summing a bunch of sinusoids to represent something in the time domain!*
- sometimes we can look at poles and zeroes and understand the system
- we know response to a two-sided exponential input e^st is transfer function H(s)•e^st
- for sinusoids, it is the case where `s` is purely imanginary by euler's formula, so e^(j&omega;t)
- the **frequency response** of a system is H(j&omega;), s = j&omega; or s is a sinusoid
- if instead the input is of the form e^jwt unitstep(t), then it may provoke transients that are not of the form e^jwt
- if H(s) is stable, then in "steady-state" (neglecting transient terms which decay to 0) the output will be H(jw)e^jwt unitstep(t)

It seems the frequency response contains just as much information as the impluse or step responses. 

### Part 5-2: Bode Plots
We know that putting sinusoids as input to a system (the frequency response) restricts what algebraic transformations can occur. This happens to mean that for sinusoids, this is only two things that can change: amplitude and phase. So for a fixed frequency input, the output has the exact same frequency. So a Bode Plot is just some graphical representation of what our system response looks like for all possible inputs (changing the frequency)
- going to call amplitude gain, and do this on a logarithmic scale (and first convert amplitude to power (and power is proportional to amplitude squared)
- going to plot phase in degrees against frequency of the input sinusoid

We can use transfer functions again let's us find the bode plot of a system
- we only want frequency response, so steady-state response (ignoring transients, or the real part of s is 0) j&omega;
- as before, input is multiplied by transfer function, which gives us a complex number as the result
  - length of the line gives us gain
  - angle off the real axis is the phase (arctan)

Graphing Bode Plots by hand from the transfer function, with straight line approximation
- ex: transfer function H(s) = K, then gain = log K dB, and phase = 0 deg for positive K, -180 for negative K
  - poles cause the transfer function to approach ∞
  - zeroes cause the transfer function to equal 0
- we plot frequency on a log scale too
- poles at the origin for transfer function (1/s) contribute 20 dB/log omega to the gain and -90 deg 
  - we can use properties of logarithms to do summations instead of multiplication
- zeroes give us the negative gain and phase of a pole

So transfer functions in LTI systems can be decomposed into a product of four types of components:

1. Constants (where the gain is constant, log K and phase is 0 or 180 for ±K)
2. Poles/Zeroes at origin (where gain is a linear function (dB vs. decades of &omega;) slope -20 dB/dec, phase is ±90 deg)
3. Real Poles/Zeroes
  - K/(1+&tau;s) is our transfer function with the "Time Constant" (recall the standard first order system transfer function)
  - magnitude/gain is 20 log K - 20 log √(1 + (&omega;&tau;)^2), phase is -(angle of jw - (-1/&tau;))
  - draw by hand with low and high-frequency asymptotes
  - for gain we have two straight lines: look at &omega; >> 1/&tau;, &omega; << 1/&tau;, the bend occurs at 1/&tau;
    - two line estimate is -∞ to 1/&tau; to ∞ (second part is sloped)
  - for phase we have three straight lines, (visually, as &omega; -> ∞, the imaginary part goes to infinity with a fixed real part):  angle varies from 0 to -90
  - the exact value of the angle for jw - (-1/&tau;) is Tan<sup>-1</sup> &omega;/(1/&tau;))
    - three line estimate is -∞ to 0.1/&tau; to 10/&tau; to ∞
  - zero is drawn as 1/pole
4. Complex Poles, we have to check a third case for magnitude, where &omega; = 1/&tau;, in which case we get a bump in the graph
  
### Part 6: Fourier Series
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
  - from above, what we mean by orthogonal basis is that, like in linear algebra, multiplying any of the two sinusoids together (inner product/dot product ish) we get zero, which means that any two sinusoids are orthogonal which is exactly what we showed above for the definite integrals
  - *orthogonality is an important property, it allows us to get a unique representation of some function f(t) as a composition of sinusoids*
  - we can find a formula for the coefficients of each sinusoid, by taking the projection of the function onto each of the sinusoids, that is intuitively, *we're just finding coefficients to tell us how much each sinusoid is expressed in f(t). An analogy is to think of sinusoids as independent from each other (since they're orthogonal) and summing across them lets us break f(t) into a sum of small parts, and we use projections to determine how much each sinusoid term should be worth in our summation.* 
- each projection is actually a definite integral, which describes part of the subspace that we're projecting onto
- a funciton is **periodic** with period T if for all t, f(t + T) = f(t)
  - try to represent it as a superposition of sinusoidal functions `e^(j2pi n t / T)`, n is an integer
- such functions are "eigenvectors" or rather *eigenfunctions* of linear systems (scalar multiple after being transformed by the system)
- **inner product** is an algebraic operation, just simply multiplying them together on some interval
