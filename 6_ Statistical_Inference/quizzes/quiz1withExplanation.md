# Statistical Inference Quiz 1 (JHU) Coursera

Question 1
----------
Consider influenza epidemics for two parent heterosexual families. Suppose that the probability is 17% that at least one of the parents has contracted the disease. The probability that the father has contracted influenza is 12% while the probability that both the mother and father have contracted the disease is 6%. What is the probability that the mother has contracted influenza?

(Hints look at lecture 2 around 5:30 and chapter 4 problem 4).

* 17%

* 6%

* 11% (answer)

* 5%

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
A random variable, X is uniform, a box from 0 to 1 of height 1. (So that its density is f(x)=1 for 0≤x≤1.) What is its 75th percentile?

(Hints, look at lecture 2 around 21:30 and Chapter 5 Problem 5. Also, look up the help function for the qunif command in R.)

* 0.50

* 0.10

* 0.25

* 0.75 (answer)

Explanation: </br>

```{r}
qunif(p=0.75, min = 0, max = 1)
```

```{r}
## [1] 0.75
```

Question 3
----------
You are playing a game with a friend where you flip a coin and if it comes up heads you give her X dollars and if it comes up tails she gives you Y dollars. The probability that the coin is heads is p (some number between 0 and 1.) What has to be true about X and Y to make so that both of your expected total earnings is 0. The game would then be called “fair”.

(Hints, look at Lecture 4 from 0 to 6:50 and Chapter 5 Problem 6. Also, for further reading on fair games and gambling, start with the Dutch Book problem ).

* X = Y

* p = X/Y

* p/(1−p) = X/Y

* p/(1−p) = Y/X (answer)

Explanation: </br>

Your expected earnings is −pX+(1−p)Y=0 Then it must be the case that p1−p=YX Or that the ratio of the payouts has to equal the odds. So consider, for example, if p1−p=2. The game is 2 to 1 against you, p=2/3; she is twice as likely to win as you. Then she will have to pay out twice as much if you win to make the game fair.

p*X = Y*(1-p), therefore p/(1-p)=Y/X.

Question 4
----------
A density that looks like a normal density (but may or may not be exactly normal) is exactly symmetric about zero. (Symmetric means if you flip it around zero it looks the same.) What is its median?

(Hints, look at quantiles from Lecture 2 around 21:30 and Chapter 2 Problem 7).

* We can't conclude anything about the median.

* The median must be different from the mean.

* The median must be 1.

* The median must be 0.

Explanation: </br>

The density is symmetric at zero so the median must be must be 0 (50% of the probability is below 0 and 50% is above 0, when the density is symmetric at zero). 

Question 5
----------
Consider the following PMF shown below in R

```{r}
x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp
```

```{r}
## [,1] [,2] [,3] [,4]
## X 1.0 2.0 3.0 4.0
## Prob 0.1 0.2 0.3 0.4
```

What is the mean?

(Hint, watch Lecture 4 on expectations of PMFs.)

* 2

* 1

* 3 (answer)

* 4

```{r}
fi <- temp["X",]
xi <- temp["Prob",] 
  
product <- fi*xi
sum(product)
```

Question 6
----------
A web site (www.medicine.ox.ac.uk/bandolier/band64/b64-7.html) for home pregnancy tests cites the following: “When the subjects using the test were women who collected and tested their own samples, the overall sensitivity was 75%. Specificity was also low, in the range 52% to 75%.” Assume the lower value for the specificity. Suppose a subject has a positive test and that 30% of women taking pregnancy tests are actually pregnant. What number is closest to the probability of pregnancy given the positive test?

(Hints, watch Lecture 3 at around 7 minutes for a similar example. Also, there's a lot of Bayes' rule problems and descriptions out there, for example here's one for HIV testing. Note, discussions of Bayes' rule can get pretty heady. So if it's new to you, stick to basic treatments of the problem. Also see Chapter 3 Question 5.)

* 30%

* 40% (answer)

* 20%

* 10%

Explanation: </br>
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/6_%20Statistical_Inference/data/pregnant.png)
