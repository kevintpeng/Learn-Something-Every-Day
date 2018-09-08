# [SE380: Introduction to Feedback Control Systems](https://uwflow.com/course/se380)
- [Introduction](http://davepagurek.github.io/SE-Notes/se380/01%20intro.html)
  - u(t) is convention for control systems (control signal), effectively our algorithm
  - r(t) is also convention, for reference signal
- open loop solution is missing feedback from y(t), so the algorithm cannot effectively make r(t) and y(t) converge
- simple closed loop algorithm:

```
// positive if too close, neg if too far
distance_adjustment = r(t) - y(t)
u(t) = -Kp * distance_adjustment
```

Better algorithm, we can add another term with an integral that effectively keeps a history of choices to better influence the velocity.

### Review
- Complex Numbers
  - Euler's Identity: $e^{j\theta} = \cos(\theta) + j\sin(\theta)$ gives us a way to think about complex numbers in terms of angles
  - Polar form makes it easy to multiply/divide: $|z| = ℝ$ and $< z = \theta$
  - Complex conjugate, $\bar{z}$ of the denominator for turning division into multiplication
    - $z\bar{z} = |z|^2$
