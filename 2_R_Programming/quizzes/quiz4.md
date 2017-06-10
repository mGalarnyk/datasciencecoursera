# R Programming Quiz 4

github repo for rest of specialization: [Data Science Coursera](https://github.com/mGalarnyk/datasciencecoursera)

Question 1
----------

What is produced at the end of this snippet of R code?
```R
set.seed(1)
rpois(5, 2)
```
### Answer

A vector with the numbers 1, 1, 2, 4, 1

Question 2
----------

What R function can be used to generate standard Normal random variables?

### Answer

rnorm

Question 3
----------

When simulating data, why is using the `set.seed()` function important?

### Answer
			
It ensures that the sequence of random numbers starts in a specific place and is therefore reproducible.


Question 4
----------

Which function can be used to evaluate the inverse cumulative distribution function for the Poisson distribution?

### Answer

qpois

### Explanation

Probability distribution functions beginning with the `q` prefix are used to evaluate the quantile function.

Question 5
----------

What does the following code do?
```R
set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
```

### Answer

Generate data from a Normal linear model

Question 6
----------
What R function can be used to generate Binomial random variables?

### Answer

rbinom

Question 7
----------

What aspect of the R runtime does the profiler keep track of when an R expression is evaluated?

### Answer

the function call stack	

Question 8
----------
Consider the following R code
```R
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
```
(Assume that y, x1, and x2 are present in the workspace.) Without running the code, what percentage of the run time is spent in the `lm` function, based on the `by.total` method of normalization shown in `summaryRprof()`?

### Answer

100%

### Explanation

When using `by.total` normalization, the top-level function (in this case, `lm()`) always takes 100% of the time.

Question 9
----------

When using `system.time()`, what is the user time?

### Answer

It is the time spent by the CPU evaluating an expression

Question 10
-----------

If a computer has more than one available processor and R is able to take advantage of that, then which of the following is true when using `system.time()`?

### Answer

Elapsed time may be smaller than user time
