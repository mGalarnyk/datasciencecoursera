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

What is the normalized feature x<sub>1</sub><sup>(3)</sup>? (Hint: midterm = 94, final = 87 is training example 3.) 
Please round off your answer to two decimal places and enter in the text box below.

Answer: </br>

The mean of x<sub>1</sub> is 272.25 and the range is 94 - 69 is 25. </br>

x<sub>1</sub><sup>(3)</sup> = (94 - 81) / 25 = <b>90.76</b>

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
Answer: </br>


Question 5
----------


Answer: </br>

True or False | Statement 
--- | ---
True | Examine a web page, and classify whether the content on the web page should be considered "child friendly" (e.g., non-pornographic, etc.) or "adult."
True | In farming, given data on crop yields over the last 50 years, learn to predict next year's crop yields.
