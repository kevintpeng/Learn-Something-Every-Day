# Math 213
### Summary
- differential equations contain derivatives of a dependent variable
- we can avoid numerical solutions if the equation is a linear ordinary differential equation (ODE) with constant coefficients
- then when solving a differential equation, we want to find some function that satisfies the expression, which can be solved given the initial condition, and by finding a function of the form `y(t) = c•e^(mt)` (since it has a nice derivative allowing us to find a characteristic equation, often polynomial). Then, using each root and initial conditions, we can find an equation for each unknown constant 
- let Q(D) is a polynomial of differentials with coefficients, and when multiplied with some y(t), we get a ODE Q(D)y(t) = P(D)f(t), and in this course, we solve for y(t) with a given P(D)
- Laplast Transform allows us to solve differential equations, by solving an algebraic equation in the Laplast domain

### [Pre-reading](http://users.math.msu.edu/users/gnagy/teaching/ode.pdf)
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
