# Statistical Inference Quiz 2 (JHU) Coursera

Question 1
----------
What is the variance of the distribution of the average an IID draw of n observations from a population with mean μ and variance σ<sup>2</sup>.

* σ/n

* σ<sup>2</sup> /n 

* σ<sup>2</sup>

* 2σ/n<sup>.5</sup>

Answer: </br>

σ<sup>2</sup> /n 

Question 2
----------
Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are normally distributed with a mean of 80 (mm Hg) and a standard deviation of 10. About what is the probability that a random 35-44 year old has a DBP less than 70?

* 22%

* 8%

* 32%

* 16%

Answer: </br>

```{r}
pnorm(70, mean = 80, sd = 10)
```

```{r}
## [1] 0.1587
```

Question 3
----------
Brain volume for adult women is normally distributed with a mean of about 1,100 cc for women with a standard deviation of 75 cc. What brain volume represents the 95th percentile?

* approximately 1223

* approximately 1247

* approximately 977

* approximately 1175

Answer: </br>
```{r}
qnorm(0.95, mean = 1100, sd = 75)
```

```{r}
## [1] 1223
```
Question 4
----------
Refer to the previous question. Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc. Consider the sample mean of 100 random adult women from this population. What is the 95th percentile of the distribution of that sample mean?

(Hints, look at quantiles from Lecture 2 around 21:30 and Chapter 2 Problem 7).

* approximately 1112 cc

* approximately 1088 cc

* approximately 1115 cc

* approximately 1110 cc

Answer: </br>

```{r}
qnorm(0.95, mean = 1100, sd = 75/sqrt(100))
```

```{r}
## [1] 1112
```

Question 5
----------
You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?

* 12%

* 6%

* 19%

* 3%

Answer: </br>

```{r}
pbinom(3, size = 5, prob = 0.5, lower.tail = FALSE)
```

```{r}
## [1] 0.1875
```

Explanation: I don't find answers like use this random R function too useful especially for interviews where you have to understand the stats, so I wrote it out by hand. 

![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/6_%20Statistical_Inference/data/quizImages/quiz2coinFlipsExplanation.jpg)

Question 6
----------
The respiratory disturbance index (RDI), a measure of sleep disturbance, for a specific population has a mean of 15 (sleep events per hour) and a standard deviation of 10. They are not normally distributed. Give your best estimate of the probability that a sample mean RDI of 100 people is between 14 and 16 events per hour?

* 34%

* 95%

* 68%

* 47.5%

Answer: </br>
The standard error of the mean is 10/100^.5 = 1. Thus between 14 and 16 is with one standard deviation of the mean of the distribution of the sample mean. Thus it should be about 68%.

```{r}
pnorm(16, mean = 15, sd = 1) - pnorm(14, mean = 15, sd = 1)
```

```{r}
## [1] 0.6827
```

Question 7
----------
Consider a standard uniform density. The mean for this density is .5 and the variance is 1 / 12. You sample 1,000 observations from this distribution and take the sample mean, what value would you expect it to be near?

* 0.75

* 0.25

* 0.5

* 0.10

Answer: </br>
Via the LLN it should be near .5.

Question 8
----------
The number of people showing up at a bus stop is assumed to be

Poisson with a mean of 5 people per hour. You watch the bus

stop for 3 hours. About what's the probability of viewing 10 or fewer people?

* 0.12

* 0.06

* 0.08

* 0.03

Answer: </br>

```{r}
ppois(10, lambda = 15)
```

```{r}
## [1] 0.1185
```
