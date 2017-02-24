Question 1
----------

Suppose I define the following function in R

```R
cube <- function(x, n) {
        x^3
}
```

What is the result of running cube(3) in R after defining this function?

### Answer

The number 27 is returned

Question 2
----------

The following code will produce a warning in R.
```R
x <- 1:10
if(x > 5) {
        x <- 0
}
```
Why?

### Answer

'x' is a vector of length 10 and 'if' can only test a single logical statement.

Question 3
----------

Consider the following function
```R
f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
```
If I then run in R
```R
	z <- 10
	f(3)
```
What value is returned?

### Answer

10

Question 4
----------

Consider the following expression:
```R
x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
```
What is the value of 'y' after evaluating this expression?

### Answer

10

Question 5
----------
Consider the following R function
```R
h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}
```
Which symbol in the above function is a free variable?

### Answer

f

Question 6
----------

What is an environment in R?

### Answer

a collection of symbol/value pairs

Question 7
----------

The R language uses what type of scoping rule for resolving free variables?

### Answer

lexical scoping

Question 8
----------

How are free variables in R functions resolved?

### Answer

The values of free variables are searched for in the environment in which the function was defined

Question 9
----------

What is one of the consequences of the scoping rules used in R?

### Answer

All objects must be stored in memory	Correct	1.00

Question 10
-----------

In R, what is the parent frame?

### Answer

It is the environment in which a function was called
