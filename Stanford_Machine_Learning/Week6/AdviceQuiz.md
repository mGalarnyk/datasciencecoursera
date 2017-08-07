# Machine Learning Week 3 Quiz 1 (Logistic Regression) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ1.png)

Answer | Explanation
--- | ---
High Bias | This learning curve shows high error on both the training and test
sets, so the algorithm is suffering from high bias.

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ2.png)

Useful Info: Since the hypothesis performs <b> well </b> (has low error) on the training set, it is suffering from high variance (overfitting)

True/False | Answer | Explanation
--- | --- | ---
False | Try evaluating the hypothesis on a cross validation set rather than the test set. | 
False | Try decreasing the regularization parameter λ. | The gap in errors between training and test suggests a high variance problem in which the algorithm has overfit the training set. Decreasing the regularization parameter will increase the overfitting, not decrease it.
False | Try using a smaller set of features. | The gap in errors between training and test suggests a high
variance problem in which the algorithm has overfit the training set. Reducing the feature set will ameliorate the overfitting and
help with the variance problem
True | Try increasing the regularization parameter λ. |  The gap in errors between training and test suggests a high
variance problem in which the algorithm has overfit the training set. Increasing the regularization parameter will reduce
overfitting and help with the variance problem.
True | Get more training examples | The gap in errors between training and test suggests a high variance problem in which the algorithm has overfit the training set. Adding more training data will increase the complexity of the training set and help with the variance problem.

Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ3.png)

True/False | Answer | Explanation
--- | --- | ---
False | Try evaluating the hypothesis on a cross validation set rather than the test set. | 
False | Try decreasing the regularization parameter λ. | The gap in errors between training and test suggests a high variance problem in which the algorithm has overfit the training set. Decreasing the regularization parameter will increase the overfitting, not decrease it.
False | Try using a smaller set of features. | The gap in errors between training and test suggests a high
variance problem in which the algorithm has overfit the training set. Reducing the feature set will ameliorate the overfitting and
help with the variance problem
True | Try increasing the regularization parameter λ. |  The gap in errors between training and test suggests a high
variance problem in which the algorithm has overfit the training set. Increasing the regularization parameter will reduce
overfitting and help with the variance problem.
True | Get more training examples | The gap in errors between training and test suggests a high variance problem in which the algorithm has overfit the training set. Adding more training data will increase the complexity of the training set and help with the variance problem.

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ4.png)

Answer | Explanation
--- | ---
The cost function J(θ) for logistic regression trained with examples is always greater than or equal to zero. | The cost for any example x<sup>(i)</sup> is always ≥ 0 since it is the negative log of a quantity less than one. The cost function J(θ) is a summation over the cost for each eample, so the cost function itself must be greater than or equal to zero.
The sigmoid function is never greater than one | none


Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ5.png)
