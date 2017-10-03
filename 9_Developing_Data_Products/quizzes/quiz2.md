# Regression Models Quiz 2 (JHU) Coursera

Question 1
----------
Consider the following data with x as the predictor and y as as the outcome.

```R
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
```

Give a P-value for the two sided hypothesis test of whether β1 from a linear regression model is 0 or not.

* 2.325

* 0.05296

* 0.025

* 0.391

```R
# Method 1: Use lm
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
coefTable <- coef(summary(fit))
(pval <- coefTable[2, 4])

# Answer
# 0.05296439

# Method 2: From Scratch
n <- length(y)
beta1 <- cor(y, x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
e <- y - beta0 - beta1 * x
sigma <- sqrt(sum(e ^ 2) / (n - 2)) 
ssx <- sum((x - mean(x)) ^ 2)
seBeta1 <- sigma / sqrt(ssx)
tBeta1 <- beta1 / seBeta1
(pBeta1 <- 2 * pt(abs(tBeta1), df = n - 2, lower.tail = FALSE))

# Answer
# 0.05296439
```

Question 2
----------
Consider the previous problem, give the estimate of the residual standard deviation (Formula Below).

<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/7_Regression_Models/images/residualStandardDev.png" alt="Residual Standard Deviation Formula">

* 0.05296

* 0.4358

* 0.223

* 0.3552

```R
# Method 1: Use lm
summary(fit)$sigma
# 0.2229981

# Method 2: From Scratch
(sigma <- sqrt(sum(e ^ 2) / (n - 2)))
# 0.2229981
```

Question 3
----------
In the 𝚖𝚝𝚌𝚊𝚛𝚜 data set, fit a linear regression model of weight (predictor) on mpg (outcome). Get a 95% confidence interval (formula below) for the expected mpg at the average weight. What is the lower endpoint?

<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/7_Regression_Models/images/nintyFiveConfidenceInterval.png" alt="Confidence Interval Formuala">

* 18.991

* -4.00

* 21.190

* -6.486

```R
# Method 1: Use lm
data(mtcars)
y <- mtcars$mpg
x <- mtcars$wt
fit_car <- lm(y ~ x)
predict(fit_car, newdata = data.frame(x = mean(x)), interval = ("confidence"))
##        fit      lwr      upr
## 1 20.09062 18.99098 21.19027

# Method 2: From Scratch
yhat <- fit_car$coef[1] + fit_car$coef[2] * mean(x)
yhat + c(-1, 1) * qt(.975, df = fit_car$df) * summary(fit_car)$sigma / sqrt(length(y))
## [1] 18.99098 21.19027
```

Question 4
----------
Refer to the previous question. Read the help file for 𝚖𝚝𝚌𝚊𝚛𝚜. What is the weight coefficient interpreted as?

* It can't be interpreted without further information

* The estimated 1,000 lb change in weight per 1 mpg increase.

* The estimated expected change in mpg per 1,000 lb increase in weight.

* The estimated expected change in mpg per 1 lb increase in weight.

Answer: </br>
The estimated expected change in mpg per 1,000 lb increase in weight.

Question 5
----------
Consider again the 𝚖𝚝𝚌𝚊𝚛𝚜 data set and a linear regression model with mpg as predicted by weight (1,000 lbs). A new car is coming weighing 3000 pounds. Construct a 95% prediction interval (formula below) for its mpg. What is the upper endpoint?

<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/7_Regression_Models/images/nintyFivePredictionInterval.png" alt="Prediction Interval Formula">

* 14.93

* 27.57

* -5.77

* 21.25

```R
# Method 1: Using lm 
predict(fit_car, newdata = data.frame(x = 3), interval = ("prediction"))
##      fit      lwr      upr
## 21.25171 14.92987 27.57355

# Method 2: Mostly from Scatch
yhat <- fit_car$coef[1] + fit_car$coef[2] * 3
yhat + c(-1, 1) * qt(.975, df = fit_car$df) * summary(fit_car)$sigma * sqrt(1 + (1/length(y)) + ((3 - mean(x)) ^ 2 / sum((x - mean(x)) ^ 2)))
## 14.92987 27.57355
```


Question 6
----------
Consider again the 𝚖𝚝𝚌𝚊𝚛𝚜 data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). A “short” ton is defined as 2,000 lbs. Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in weight. Give the lower endpoint.

* -12.973

* -9.000

* -6.486

* 4.2026

```R
# Change unit of the predictor from 1000 lbs to 2000 lbs.
fit_car2 <- lm(y ~ I(x/2))
sumCoef2 <- coef(summary(fit_car2))
(sumCoef2[2,1] + c(-1, 1) * qt(.975, df = fit_car2$df) * sumCoef2[2, 2])
# -12.97262  -8.40527

```

Question 7
----------
If my X from a linear regression is measured in centimeters and I convert it to meters what would happen to the slope coefficient?

* It would get divided by 10

* It would get multiplied by 10

* It would get divided by 100

* It would get multiplied by 100.

```R
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
fit$coef[2]
##         x 
## 0.7224211

x_meter <- x / 100
fit_meter <- lm(y ~ x_meter)
fit_meter$coef[2]
##  x_meter 
## 72.24211
```

Question 8
----------
I have an outcome, Y, and a predictor, X and fit a linear regression model with Y=β0+β1X+ϵ to obtain β^0 and β^1. What would be the consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X+c for some constant, c?

<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/7_Regression_Models/images/newIntercept.png" alt="New Intercept">

* The new slope would be β^1+c

* The new intercept would be β^0−cβ^1

* The new intercept would be β^0+cβ^1

* The new slope would be cβ^1

Proof: 

```R
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
fit$coef
## (Intercept)           x 
##   0.1884572   0.7224211

x_c <- x + 10
fit_c <- lm(y ~ x_c)
fit_c$coef
## (Intercept)         x_c 
##  -7.0357536   0.7224211

fit$coef[1] - 10 * fit$coef[2] 
## (Intercept) 
##   -7.035754
```
Question 9
----------
Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor. About what is the ratio of the the sum of the squared errors, </br> 

<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/7_Regression_Models/images/sumSquaredErrors.png" alt="Sum of Squared Errors"> </br> 
when comparing a model with just an intercept (denominator) to the model with the intercept and slope (numerator)?

* 0.50

* 4.00

* 0.75

* 0.25

```R
data(mtcars)
y <- mtcars$mpg
x <- mtcars$wt
fit_car <- lm(y ~ x)
sum(resid(fit_car)^2) / sum((y - mean(y)) ^ 2)
# 0.2471672
```

Question 10
----------
Do the residuals always have to sum to 0 in linear regression?

* If an intercept is included, the residuals most likely won't sum to zero.

* The residuals never sum to zero.

* If an intercept is included, then they will sum to 0.

* The residuals must always sum to zero.

```R
# Answer: 
# If an intercept is included, then they will sum to 0.

# With Intercept
data(mtcars)
y <- mtcars$mpg
x <- mtcars$wt
fit_car <- lm(y ~ x)
sum(resid(fit_car))
# Change to be rounded to zero
#  -1.637579e-15

# With Intercept
fit_car_noic <- lm(y ~ x - 1)
sum(resid(fit_car_noic))
# 98.11672

# With Intercept
fit_car_ic <- lm(y ~ rep(1, length(y)))
sum(resid(fit_car_ic))
# Change to be rounded to zero
# -5.995204e-15
```
