# Machine Learning Week 3 Quiz 1 (Logistic Regression) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/logisticq1.PNG)

Answer | Explanation
--- | ---
Our estimate for P(y=0\|x;θ) is 0.8. | P(y=0\|x;θ) = 1 - P(y = 1\| x; θ); the former is 1 - 0.2 = 0.8
Our estimate for P(y=1\|x;θ) is 0.2. | h<sub>θ</sub>(x) = 0.2

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/logisticQ2part2answers.png)

Answer | Explanation
--- | ---
J(θ) will be a convex function, so gradient descent should converge to the global minimum. | none
Adding polynomial features (e.g., instead using h<sub>θ</sub>(x) = g(θ<sub>0</sub> + θ<sub>1</sub>x<sub>1</sub> + θ<sub>2</sub>x</sub>2 + θ<sub>3</sub>x<sup>2</sup> + θ<sub>4</sub>x<sup>1</sup>x<sup>2</sup> + θ<sub>5</sub>x<sup>2</sup> )) could increase how well we can fit the training data | Adding new features can only improve the fit on the training set: since setting θ<sub>3</sub> = θ<sub>4</sub> = θ<sub>5</sub> = 0 makes the hypothesis the same as the original one, gradient descent will use those features (by making the corresponding non-zero) only if doing so improves the training set fit

Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/logisticq3.PNG)

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/logisticq4.PNG)

Answer | Explanation
--- | ---
The cost function J(θ) for logistic regression trained with examples is always greater than or equal to zero. | The cost for any example x<sup>(i)</sup> is always ≥ 0 since it is the negative log of a quantity less than one. The cost function J(θ) is a summation over the cost for each eample, so the cost function itself must be greater than or equal to zero.
The sigmoid function is never greater than one | none


Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/logisticQ5part1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/logisticQ5part2.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/logisticQ5answer.jpg)
