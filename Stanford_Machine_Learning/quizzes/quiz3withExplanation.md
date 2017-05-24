# Statistical Inference Quiz 3 (JHU) Coursera

Question 1
----------
In a population of interest, a sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is a 95% Student's T confidence interval for the mean brain volume in this new population?

* [1092, 1108]

* [1031, 1169]

* [1080, 1120]

* [1077,1123]

Answer: </br>

```{r}
x_bar <- 1100
s <- 30
n <- 9
alpha <- 0.05
ts <- qt(1 - alpha / 2, n - 1) # 2.306004
round(x_bar + c(-1, 1) * ts * s / sqrt(n))
```

```{r}
# 1077 1123
```

Question 2
----------
A diet pill is given to 9 subjects over six weeks. The average difference in weight (follow up - baseline) is -2 pounds. What would the standard deviation of the difference in weight have to be for the upper endpoint of the 95% T confidence interval to touch 0?

* 0.30

* 1.50

* 2.60

* 2.10

Answer: </br>
```{r}
x_bar <- -2
n <- 9
alpha <- 0.05
ts <- qt(1 - alpha / 2, n - 1) # 2.306004
s <- -x_bar*sqrt(n) / ts
```

```{r}
# 2.601903
```

Question 3
----------
In an effort to improve running performance, 5 runners were either given a protein supplement or placebo. Then, after a suitable washout period, they were given the opposite treatment. Their mile times were recorded under both the treatment and placebo, yielding 10 measurements with 2 per subject. The researchers intend to use a T test and interval to investigate the treatment. Should they use a paired or independent group? T test and interval?

* Independent groups, since all subjects were seen under both systems

* You could use either

* It's necessary to use both

* A paired interval

Answer: </br>
Independent tests: not related participants </br>
Paired tests: related participants, same group uses 2 different tests </br>
A paired interval. </br>

Question 4
----------
In a study of emergency room waiting times, investigators consider a new and the standard triage systems. To test the systems, administrators selected 20 nights and randomly assigned the new triage system to be used on 10 nights and the standard system on the remaining 10 nights. They calculated the nightly median waiting time (MWT) to see a physician. The average MWT for the new system was 3 hours with a variance of 0.60 while the average MWT for the old system was 5 hours with a variance of 0.68. Consider the 95% confidence interval estimate for the differences of the mean MWT associated with the new system. Assume a constant variance. What is the interval? Subtract in this order (New System - Old System).

* [1.25, 2.75]

* [-2,70, -1.29]

* [-2.75, -1.25]

* [1.29, 2.70]

Answer: </br>
```{r}
n_x <- 10 
n_y <- 10
x_bar <- 5 # old_system
y_bar <- 3 # new_system
var_x <- 0.6
var_y <- 0.68
alpha <- 0.05
sp_2 <- ((n_x - 1)*var_x + (n_y - 1)*var_y) / (n_x + n_y - 2)
sp <- sqrt(sp_2)
ts <- qt(1 - (alpha/2), n_x + n_y - 2)
round((y_bar - x_bar) + c(-1, 1) * ts * sp * (sqrt(1/n_x + 1/n_y)), 2) 
```

```{r}
# -2.75 -1.25
```

Question 5
----------
Suppose that you create a 95% T confidence interval. You then create a 90% interval using the same data. What can be said about the 90% interval with respect to the 95% interval?

* It is impossible to tell.

* The interval will be the same width, but shifted.

* The interval will be wider

* The interval will be narrower.

Answer: </br>
The interval will be narrower.

Question 6
----------
To further test the hospital triage system, administrators selected 200 nights and randomly assigned a new triage system to be used on 100 nights and a standard system on the remaining 100 nights. They calculated the nightly median waiting time (MWT) to see a physician. The average MWT for the new system was 4 hours with a standard deviation of 0.5 hours while the average MWT for the old system was 6 hours with a standard deviation of 2 hours. Consider the hypothesis of a decrease in the mean MWT associated with the new treatment.

What does the 95% independent group confidence interval with unequal variances suggest vis a vis this hypothesis? (Because there's so many observations per group, just use the Z quantile instead of the T.)

* When subtracting (old - new) the interval is entirely above zero. The new system does not appear to be effective.

* When subtracting (old - new) the interval contains 0. The new system appears to be effective.

* When subtracting (old - new) the interval contains 0. There is not evidence suggesting that the new system is effective.

* When subtracting (old - new) the interval is entirely above zero. The new system appears to be effective.

Answer: </br>
When subtracting (old - new) the interval is entirely above zero. The new system appears to be effective.

Explanation: 

```{r}
n_x <- 100
n_y <- 100
x_bar <- 6
y_bar <- 4
s_x <- 2
s_y <- 0.5
alpha <- 0.05
sp_2 <- ((n_x - 1)*s_x^2 + (n_y - 1)*s_y^2) / (n_x + n_y - 2)
sp <- sqrt(sp_2)
ts <- qt(1 - (alpha/2), n_x + n_y - 2)
round((x_bar - y_bar) + c(-1, 1) * ts * sp * (sqrt(1/n_x + 1/n_y)), 2) 
```

```{r}
# 1.59 2.41
```

Question 7
----------
Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects’ body mass indices (BMIs) were measured at a baseline and again after having received the treatment or placebo for four weeks. The average difference from follow-up to the baseline (followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI over the four week period appear to differ between the treated and placebo groups? Assuming normality of the underlying data and a common population variance, calculate the relevant *90%* t confidence interval. Subtract in the order of (Treated - Placebo) with the smaller (more negative) number first.

* [2.469, 5.531]

* [2.636, 5.364]

* [-5.364, -2.636]

* [-5.531, -2.469]

Answer: </br>

```{r}
n1 <- 9
n2 <- 9
x1 <- -3 # treated
x2 <- 1 # placebo
s1 <- 1.5 # treated
s2 <- 1.8 # placebo
s <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2)/(n1 + n2 - 2))
(x1 - x2) + c(-1, 1) * qt(0.95, n1 + n2 - 2) * s * sqrt(1/n1 + 1/n2)
```

```{r}
# -5.364 -2.636
```
