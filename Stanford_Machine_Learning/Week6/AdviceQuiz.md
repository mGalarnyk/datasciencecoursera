# Machine Learning Week 6 Quiz 1 (Advice for Applying Machine Learning) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ1.png)

Answer | Explanation
--- | ---
High Bias | This learning curve shows high error on both the training and test sets, so the algorithm is suffering from high bias.

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ2.png)

Useful Info: Since the hypothesis performs <b> well </b> (has low error) on the training set, it is suffering from high variance (overfitting)

True/False | Answer | Explanation
--- | --- | ---
False | Try evaluating the hypothesis on a cross validation set rather than the test set. | A cross validation set is useful for choosing the optimal non-model parameters like the regularization parameter λ, but the train / test split is sufficient for debugging problems with the algorithm itself.
False | Try decreasing the regularization parameter λ. | The gap in errors between training and test suggests a high variance problem in which the algorithm has overfit the training set. Decreasing the regularization parameter will increase the overfitting, not decrease it.
True | Try using a smaller set of features. | The gap in errors between training and test suggests a high variance problem in which the algorithm has overfit the training set. Reducing the feature set will ameliorate the overfitting and help with the variance problem
True | Try increasing the regularization parameter λ. |  The gap in errors between training and test suggests a high variance problem in which the algorithm has overfit the training set. Increasing the regularization parameter will reduce overfitting and help with the variance problem.
True | Get more training examples | The gap in errors between training and test suggests a high variance problem in which the algorithm has overfit the training set. Adding more training data will increase the complexity of the training set and help with the variance problem.

Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ3.png)

Useful Info: Since the hypothesis performs <b> poorly </b> on the training set, it is suffering from high bias (underfitting)

True/False | Answer | Explanation
--- | --- | ---
True | Try adding polynomial features. | The poor performance on both the training and test sets suggests a high bias problem. Adding more complex features will increase the complexity of the hypothesis, thereby improving the fit to both the train and test data.
False | Try increasing the regularization parameter λ. | The poor performance on both the training and test sets suggests a high bias problem. Increasing the regularization parameter will allow the hypothesis to fit the data worse, decreasing both training and test set performance.
False | Try using a smaller set of features. | The poor performance on both the training and test sets suggests a high bias problem. Using fewer features will decrease the complexity of the hypothesis and will make the bias problem worse
True | Try to obtain and use additional features. |  The poor performance on both the training and test sets suggests a high bias problem. Using additional features will increase the complexity of the hypothesis, thereby improving the fit to both the train and test data.

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ4.png)

True/False | Answer | Explanation
--- | --- | ---
False | Suppose you are training a regularized linear regression model.The recommended way to choose what value of regularization parameter λ to use is to choose the value of λ which gives the lowest <b>training set</b> error. |  You should not use training error to choose the regularization parameter, as you can always improve training error by using less regularization (a smaller value of ). But too small of a value will not generalize well onthe test set.
True | The performance of a learning algorithm on the training set will typically be better than its performance on the test set. | The learning algorithm finds parameters to minimize training set error, so the performance should be better on the training set than the test set.
True | Suppose you are training a regularized linear regression model. The recommended way to choose what value of regularization parameter λ to use is to choose the value of λ which gives the lowest <b>cross validation</b> error | The cross validation lets us find the "just right" setting of the regularization parameter given the fixed model parameters learned from the training set. 
False | Suppose you are training a regularized linear regression model. The recommended way to choose what value of regularization parameter λ to use is to choose the value of λ which gives the lowest <b>test set</b> error. |  You should not use the test set to choose the regularization parameter, as you will then have an artificially low value for test error and it will not give a good estimate of generalization error.
True | A typical split of a dataset into training, validation and test sets might be 60% training set, 20% validation set, and 20% test set. | This is a good split of the data, as it dedicates the bulk of the data to finding model parameters in training while leaving enough data for cross validation and estimating generalization error.

Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/AdviceQ5.png)

True/False | Answer | Explanation
--- | --- | ---
True | If a learning algorithm is suffering from high bias, only adding more training examples may <b>not</b> improve the test error significantly. |  If a learning algorithm is suffering from high bias, only adding more training examples may not improve the test error significantly.
True | A model with more parameters is more prone to overfitting and typically has higher variance. | More model parameters increases the model's complexity, so it can more tightly fit data in training, increasing the chances of overfitting.
True | When debugging learning algorithms, it is useful to plot a learning curve to understand if there is a high bias or high variance problem. | The shape of a learning curve is a good indicator of bias or variance problems with your learning algorithm.
False | If a neural network has much lower training error than test error, then adding more layers will help bring the test error down because we can fit the test set better. | With lower training than test error, the model has high variance. Adding more layers will increase model complexity, making the variance problem worse.
