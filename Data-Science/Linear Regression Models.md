### Coefficient of Determination
`R^2` indicates the proportion of variance in the dependent variable that is predictable from the independent variable
- is very high when the line is fit well
- `r^2` is the square of the sample correlation coefficient
- r = 0.7, r^2 = 0.49 implying 49% of variability in x is caused by variability in y, so 51% is unaccounted for

### Generalized Linear Model
for p-dimensional fector function `y-hat(w,x) = w0 + w1x1 + ... + wpxp`, w = (w1,...,wp) are coefficients and w0 is the intercept
- linear regression fits a line (linear model) to minimize the sum of squares between observations
- computes using SVD of X, then for `n` p-dimensional vectors (n x p matrix), ordinary least squares is O(np^2)

### Ridge Regression
Ridge regression imposes a penalty on Ordinary Least Squares, introducing a ridge coefficient which minimizes the residual sum of squares
- shrinkage is when a fitted relationship performs less well on a new data set 

### [Least Angle Regression](../Research-Papers/2003 Least Angle Regression.md)
Regression algorithm for high-dimensional data
- numerically efficient when p >> n, for n x p matrix or n p-dimensional vectors

### Logistic Regression
Linear model for classification rather than regression. Can be used for binary, or multinomial logistic regression
