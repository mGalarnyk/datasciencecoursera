Quiz
====

Question 1
----------

Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
```R
library(datasets)
data(iris)
```
A description of the dataset can be found by running
```R
?iris
```
There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? (Please only enter the numeric result and nothing else.)

### Answer

6.588

```R
# if you don't have data.table installed
# install.packages("data.table")

library(data.table)
iris_dt <- as.data.table(iris)
iris_dt[Species == "virginica",round(mean(Sepal.Length)) ]
```

Question 2
----------

Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

### Answer
```R
apply(iris[, 1:4], 2, mean)
```

Question 3
----------

Load the 'mtcars' dataset in R with the following code
```R
library(datasets)
data(mtcars)
```
There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running
```R
?mtcars
```
How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?

### Answer
```R
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply( split(mtcars$mpg, mtcars$cyl) , mean)
```

Question 4
----------

Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

### Answer

126.5779

```R
mtcars_dt <- as.data.table(mtcars)
mtcars_dt <- mtcars_dt[,  .(mean_cols = mean(hp)), by = cyl]
round(abs(mtcars_dt[cyl == 4, mean_cols] - mtcars_dt[cyl == 8, mean_cols]))
````

Question 5
----------

If you run
```R
debug(ls)
```
what happens when you next call the 'ls' function?

### Answer

Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.
