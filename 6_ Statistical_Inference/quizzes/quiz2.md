# Statistical Inference Quiz 2 (JHU) Coursera

Question 1
----------
What is the variance of the distribution of the average an IID draw of n observations from a population with mean μ and variance σ<sup>2</sup>.

* σ/n

* σ<sup>2</sup> /n

* σ<sup>2</sup>

* 2σ/n<sup>.5</sup>

Explanation: </br>

For any two events the probability that at least one occurs is the sum of their probabilities minus their intersection. 

![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/6_%20Statistical_Inference/data/unionIntersection.png)
</br>
unions: (denoted by ∪) of a collection of sets is the set of all elements in the collection
</br> A = {1, 3, 5, 7} and B = {1, 2, 4, 6} then A ∪ B = {1, 2, 3, 4, 5, 6, 7}
</br>
intersection: (denoted by ∩) intersection A ∩ B of two sets A and B is the set that contains all elements of A that also belong to B (or equivalently, all elements of B that also belong to A), but no other elements
<br>
A = Mother
<br>
B = Father
<br>
P(A∪B) = 17%
<br>
P(B) = 12%
<br>
P(A∩B) = 6%
<br>
Since we know P(A∪B)=P(A)+P(B)−P(A∩B) we get
<br>
17%=P(A)+12%−6%.
<br>
P(A) = 11%

Question 2
----------
Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are normally distributed with a mean of 80 (mm Hg) and a standard deviation of 10. About what is the probability that a random 35-44 year old has a DBP less than 70?

* 22%

* 8%

* 32%

* 16%

Explanation: </br>

```{r}
qunif(p=0.75, min = 0, max = 1)
```

```{r}
## [1] 0.75
```

Question 3
----------
Brain volume for adult women is normally distributed with a mean of about 1,100 cc for women with a standard deviation of 75 cc. What brain volume represents the 95th percentile?

* approximately 1223

* approximately 1247

* approximately 977

* approximately 1175

Explanation: </br>

Question 4
----------
Refer to the previous question. Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc. Consider the sample mean of 100 random adult women from this population. What is the 95th percentile of the distribution of that sample mean?

(Hints, look at quantiles from Lecture 2 around 21:30 and Chapter 2 Problem 7).

* approximately 1112 cc

* approximately 1088 cc

* approximately 1115 cc

* approximately 1110 cc

Explanation: </br>



Question 5
----------
You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?

* 12%

* 6%

* 19%

* 3%

Question 6
----------
The respiratory disturbance index (RDI), a measure of sleep disturbance, for a specific population has a mean of 15 (sleep events per hour) and a standard deviation of 10. They are not normally distributed. Give your best estimate of the probability that a sample mean RDI of 100 people is between 14 and 16 events per hour?

* 34%

* 95%

* 68%

* 47.5%

Explanation: </br>

Question 7
----------
Consider a standard uniform density. The mean for this density is .5 and the variance is 1 / 12. You sample 1,000 observations from this distribution and take the sample mean, what value would you expect it to be near?

* 0.75

* 0.25

* 0.5

* 0.10

Question 8
----------
The number of people showing up at a bus stop is assumed to be

Poisson with a mean of 5 people per hour. You watch the bus

stop for 3 hours. About what's the probability of viewing 10 or fewer people?

* 0.12

* 0.06

* 0.08

* 0.03

