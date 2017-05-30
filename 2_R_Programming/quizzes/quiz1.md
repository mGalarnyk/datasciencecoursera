Question 1
----------
R was developed by statisticians working at...

### Answer
The University of Auckland

Question 2
----------
The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?

### Answer
The freedom to sell the software for any price.

Question 3
----------
In R the following are all atomic data types EXCEPT

### Answer
matrix

Question 4
----------
If I execute the expression x <- 4 in R, what is the class of the object 'x' as determined by the `class()' function?

### Answer
numeric
```R
x <- 4
class(x)
```

Question 5
----------
What is the class of the object defined by x <- c(4, TRUE)?

### Answer
numeric

```R
x <- c(4, TRUE)
class(x)
```

Question 6
----------
If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?

### Answer
a 3 by 2 numeric matrix	

```R
x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x, y)
```

Question 7
----------
A key property of vectors in R is that

### Answer
elements of a vector all must be of the same class

Question 8
----------
Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me?

### Answer
a numeric vector containing the element 2

```R
x <- list(2, "a", "b", TRUE)
x[[1]]

class(x[[1]])
```

Question 9
----------
Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?

### Answer
a numeric vector with elements 3, 4, 5, 6.

```R
x <- 1:4
y <- 2
x + y

class(x + y)
```
Question 10
-----------
Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. What R code achieves this?

### Answer

x[x >= 11] <- 4

```R
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x >= 11] <- 4
x
```

Question 11
-----------
In the dataset provided for this Quiz, what are the column names of the dataset?

### Answer
Ozone, Solar.R, Wind, Temp, Month, Day

```R
# install package if doesnt exist 
install.packages("data.table")
library("data.table")

# Reading in data
quiz_data <- fread('hw1_data.csv')

# Column names of the dataset 
names(quiz_data)

```

Question 12
-----------
Extract the first 2 rows of the data frame and print them to the console. What does the output look like?

### Answer
	  Ozone Solar.R Wind Temp Month Day
	1    41     190  7.4   67     5   1
	2    36     118  8.0   72     5   2

```R
# First two rows 
quiz_data[c(1,2),]

OR

# First two rows
head(quiz_data,2)
```

Question 13
-----------
How many observations (i.e. rows) are in this data frame?

### Answer
153

```R
nrow(quiz_data)
```

Question 14
-----------
Extract the last 2 rows of the data frame and print them to the console. What does the output look like?

### Answer

	   Ozone Solar.R Wind Temp Month Day
	152    18     131  8.0   76     9  29
	153    20     223 11.5   68     9  30

```R
tail(quiz_data, 2)
```

Question 15
-----------
What is the value of Ozone in the 47th row?

### Answer
21

```R
quiz_data[47, 'Ozone']
```

Question 16
-----------
How many missing values are in the Ozone column of this data frame?

### Answer
37

```R
# Going back to data.frame because dont it hasnt been taught yet in this specialization
quiz_data = read.csv('hw1_data.csv')
sub = subset(quiz_data, is.na(Ozone))
nrow(sub)

```

```R
# Can also remmove Missing Values using Something like This
quiz_data[complete.cases(quiz_data),]
```

Question 17
-----------
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.

### Answer
42.1

### Explanation
The 'mean' function can be used to calculate the mean.

```R
hw1 = read.csv('hw1_data.csv')
sub = subset(hw1, !is.na(Ozone), select = Ozone)
apply(sub, 2, mean) 
```

Question 18
-----------
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

### Answer
212.8

```R
quiz_data = read.csv('hw1_data.csv')
sub = subset(quiz_data, Ozone > 31 & Temp > 90, select = Solar.R)
apply(sub, 2, mean)
```

Question 19
-----------
What is the mean of "Temp" when "Month" is equal to 6?

### Answer
79.1

### Explanation

```R
quiz_data = read.csv('hw1_data.csv')
sub = subset(hw1, Month == 6, select = Temp)
apply(sub, 2, mean)
```

Question 20
-----------
What was the maximum ozone value in the month of May (i.e. Month = 5)?

### Answer
115

### Explantion

```R
quiz_data = read.csv('hw1_data.csv')
sub = subset(quiz_data, Month == 5 & !is.na(Ozone), select = Ozone)
apply(sub, 2, max)

NOTE: If we wanted more columns to display for sub we can achieve this by the following:
sub = subset(quiz_data, Month == 5 & !is.na(Ozone), select = c(Ozone, Solar.R, Day))
```
