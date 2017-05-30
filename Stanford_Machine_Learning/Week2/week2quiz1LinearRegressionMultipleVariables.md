# Machine Learning Week 2 Quiz 1 (Linear Regression with Multiple Variables) Stanford Coursera

Question 1
----------
Suppose m=4 students have taken some class, and the class had a midterm exam and a final exam. You have collected a dataset of their scores on the two exams, which is as follows:

Midterm Exam | (midterm exam)<sup>2</sup> | Final Exam 
--- | --- | ---
89 | 7921 | 96
72 | 5184 | 74
94 | 8836 | 87
69 | 4761 | 78

You'd like to use polynomial regression to predict a student's final exam score from their midterm exam score. 
Concretely, suppose you want to fit a model of the form hθ(x)=θ<sub>0</sub>+θ<sub>1</sub>x<sub>1</sub>+θ<sub>2</sub>x<sub>2</sub>, 
where x<sub>1</sub> is the midterm score and x<sub>2</sub> is (midterm score)<sup>2</sup>. 
Further, you plan to use both feature scaling (dividing by the "max-min", or range, of a feature) and mean normalization.

What is the normalized feature x<sub>2</sub><sup>(4)</sup>? (Hint: midterm = 69, final = 78 is training example 4.) 
Please round off your answer to two decimal places and enter in the text box below.

Answer: </br>

The mean of x<sub>2</sub> is 6675.5 and the range is 8836 - 4761 is 4075. </br>

x<sub>2</sub><sup>(4)</sup> = (4761 - 6675.5) / 4075 = <b>-0.47</b>

Question 2
----------
You run gradient descent for 15 iterations
with α=0.3 and compute
J(θ) after each iteration. You find that the
value of J(θ) <b>decreases</b> quickly then levels
off. Based on this, which of the following conclusions seems
most plausible?

* Rather than use the current value of α, it'd be more promising to try a larger value of α (say α=1.0).

* Rather than use the current value of α, it'd be more promising to try a smaller value of α (say α=0.1).

* α=0.3 is an effective choice of learning rate.

Answer: </br>

Answer | Explanation
--- | ---
α=0.3 is an effective choice of learning rate. | We want gradient descent to quickly converge to the minimum, so the current setting of α seems to be good

Question 3
----------
Suppose you have m=14 training examples with n=3 features (excluding the additional all-ones feature for the intercept term, which you should add). 
The normal equation is θ=(X<sup>T</sup>X)<sup>−1</sup>X<sup>T</sup>y. 
For the given values of m and n, what are the dimensions of θ, X, and y in this equation?

* X is 14×3, y is 14×1, θ is 3×3

* X is 14×4, y is 14×4, θ is 4×4

* X is 14×4, y is 14×1, θ is 4×1

* X is 14×3, y is 14×1, θ is 3×1

Answer | Explanation
--- | ---
X is 14×4, y is 14×1, θ is 4×1 | X has m rows and n + 1 columns (+1 because of the x<sub>0</sub>=1 term. y is an m-vector. θ is an (n+1)-vector.

Question 4
----------
Suppose you have a dataset with m=50 examples and n=200000 features for each example. You want to use multivariate linear regression to fit the parameters θ to our data. Should you prefer gradient descent or the normal equation?

* Gradient descent, since (X<sup>T</sup>X)<sup>−1</sup> will be very slow to compute in the normal equation.

* Gradient descent, since it will always converge to the optimal θ.

* The normal equation, since it provides an efficient way to directly find the solution.

* The normal equation, since gradient descent might be unable to find the optimal θ.

Answer | Explanation
--- | ---
Gradient descent, since (X<sup>T</sup>X)<sup>−1</sup> will be very slow to compute in the normal equation. | With n = 200000 features, you have to invert a 200001 x 200001 matrix to compute the normal equation. Inverting such a large matrix is computationally expensive, so gradient descent is a good choice. 

Question 5
----------
Which of the following are reasons for using feature scaling?

* It speeds up solving for θ using the normal equation.

* It prevents the matrix X<sup>T</sup>X (used in the normal equation) from being non-invertable (singular/degenerate).

* It is necessary to prevent gradient descent from getting stuck in local optima.

* It speeds up gradient descent by making it require fewer iterations to get to a good solution.

True or False | Statement | Explanation 
--- | --- | ---
False | It speeds up solving for θ using the normal equation. | The magnitude of the feature values are insignificant in terms of computational cost. 
False | It prevents the matrix X<sup>T</sup>X (used in the normal equation) from being non-invertable (singular/degenerate). | none
False | It is necessary to prevent gradient descent from getting stuck in local optima. | The cost function J(θ) for linear regression has no local optima. 
True | It speeds up gradient descent by making it require fewer iterations to get to a good solution. | Feature scaling speeds up gradient descent by avoiding many extra iterations that are required when one or more features take on much larger values than the rest. 
