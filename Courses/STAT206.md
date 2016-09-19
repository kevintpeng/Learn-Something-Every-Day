### Central Tendency
the degree of clustering of values of a statistical distribution
- arithmetic mean is `(1/n)∑(yi)` for 1 ≤ i ≤ n
- median or geometric mean is `(y1•y2•...•yn)^(1/n)`
- harmonic mean is the reciprocal of the arithmetic mean of the reciprocals
- For any two #s, AM ≥ GM ≥ HM
- median is the middle element of a set
- Quartiles is splitting data into four equal parts
- Percentiles break data in to 100 parts
- Mode is the element of maximum frequency

### Measure of Dispersion
- Range = Max - min
- Inter-Quartile Range (IQR) = Q3 - Q1 (where Q1=25%, Q2=50%, Q3=75%)
- Variance = `σ^2`, the average of the squared deviations from the mean
  - for mean ȳ, `σ^2 = (1/(n-1)) ∑ (yi - ȳ)^2`
- Standard deviation `σ` = positive square root of the variance
- for some transformation of the form `yi = a + bxi`, variance = `b^2 • var(x)`, sd(y) = `|b|•sd(x)`

### Measure of Skewness
```
SKEWNESS = Mean - Median
         = (1/n) ∑ (yi - ȳ)^3
         = (1/n) [∑ (yi - ȳ)^2]^(3/2)
```

- **Kurtosis** is the measure of frequency of extreme observations, compared to a normal distribution
- `K = some nast formula`, the fourth standardized moment
  - ASIDE, a standardized moment of a probability distribution is a measure of the shape of a set of points
  - the n-th moment of a continuous function ƒ(x) about a value `c` is `µn = ∫(x-c)^n • ƒ(x) dx`

### Measure of Association
- bivariate data is data that is dependent on two variables
- sample correlation coefficient quantifies the degree at which two variables are correlated
  - r ~= 0 shows no linear relationship, while |r| ~= 1 shows strong linear relationship

### Graphical Summaries of Data Sets
identifies distribution from which your sample is drawn, so you apply the right model
- Relative Frequency Histogram 
- Density Histogram, the height is chosen s.t. the relative freqency of the bin = area of the corresponding rectangle in the histogram (accounts well for variable bin widths)
  - relative freqency is `frequency of each bin/total sample size` 
- Empirical cumulative distribution function, ƒ(y) = `# of observations ≤ y/Total # of observations`
  - plots an upwards staircase
