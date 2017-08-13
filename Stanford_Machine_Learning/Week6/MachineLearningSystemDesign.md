# Machine Learning Week 6 Quiz 2 (Machine Learning System Design) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/MachineLearningSystemDesignQ1.png)

Statistic | Solution
--- | ---
Accuracy | (85 + 10) / (1000) = .095
Precision | (85) / (85 + 890) = 0.087
Recall | There are 85 true positives and 15 false negatives, so recall is 85 / (85 + 15) = 0.85.
F<sub>1</sub> Score | (2 * (0.087 * 0.85)) / (0.087 + 0.85) = 0.16

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/MachineLearningSystemDesignQ2.png)

True/False | Answer | Explanation
--- | --- | ---
False | We train a learning algorithm with a small number of parameters (that is thus unlikely to overfit). | 
True | We train a learning algorithm with a large number of parameters (that is able tolearn/represent fairly complex functions). | You should use a "low bias" algorithm with many parameters, as it will be able to make use of the large dataset provided. If the model has too few parameters, it will underfit the large training set.
True | The features x contain sufficient information to predict y accurately. (For example, one way to verify this is if a human expert on the domain can confidently predict y when given only x). | It is important that the features contain sufficient information, as otherwise no amount of data can solve a learning problem in which the features do not contain enough information to make an accurate prediction.
False | We train a model that does not use regularization. |  Even with a very large dataset, some regularization is still likely to help the algorithm's performance, so you should use cross-validation to select the appropriate regularization parameter.
False | The classes are not too skewed. | The problem of skewed classes is unrelated to training with large datasets.
True | Our learning algorithm is able to represent fairly complex functions (for example, if we train a neural network or other model with a large number of parameters). | You should use a complex, "low bias" algorithm, as it will be able to make use of the large dataset provided. If the model is too simple, it will underfit the large training set.
False | When we are willing to include high order polynomial features of x | As we saw with neural networks, polynomial features can still be insufficient to capture the complexity of the data, especially if the features are very high-dimensional. Instead, you should use a complex model with many parameters to fit to the large training set.

Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/MachineLearningSystemDesignQ3.png)

True/False | Answer | Explanation
--- | --- | ---
True | The classifier is likely to now have lower recall. | Increasing the threshold means more y = 0 predictions. This will increase the decrease of true positives and increase the number of false negatives, so recall will decrease.
False | The classifier is likely to have unchanged precision and recall, but lower accuracy. | By making more y = 0 predictions, we decrease true and false positives and increase true and false negatives. Thus, precision and recall will certainly change. We cannot say whether accuracy will increase or decrease.
False | The classifier is likely to have unchanged precision and recall, but thus the same F<sub>1</sub> score. | By making more y = 0 predictions, we decrease true and false positives and increase true and false negatives. Thus, precision and recall will certainly change. We cannot say whether the F<sub>1</sub> score will increase or decrease.
False | The classifier is likely to now have lower precision. |  Increasing the threshold means more y = 0 predictions. This will decrease both true and false positives, so precision will increase, not decrease.

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/MachineLearningSystemDesignQ4.png)

True/False | Answer | Explanation
--- | --- | ---
True | If you always predict non-spam (output y = 0 ), your classifier will have a recall of 0%. |  Since every prediction is y = 0, there will be no true positives, so recall is 0%.
False | If you always predict spam (output y = 1), your classifier will have a recall of 0% and precision of 99%. | Every prediction is y = 1, so recall is 100% and precision is only 1%.
True | If you always predict non-spam (output y = 0), your classifier will have 99% accuracy on the training set, and it will likely perform similarly on the cross validation set. | The classifier achieves 99% accuracy on the training set because of how skewed the classes are. We can expect that the cross-validation set will be skewed in the same fashion, so the classifier will have approximately the same accuracy. 
True | If you always predict spam (output y = 1), your classifier will have a recall of 100% and precision of 1%. |  Since every prediction is y = 1, there are no false negatives, so recall is 100%. Furthermore, the precision will be the fraction of examples with are positive, which is 1%.

Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/MachineLearningSystemDesignQ5p1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/MachineLearningSystemDesignQ5p2.png)

True/False | Answer | Explanation
--- | --- | ---
True | If a learning algorithm is suffering from high bias, only adding more training examples may <b>not</b> improve the test error significantly. |  If a learning algorithm is suffering from high bias, only adding more training examples may not improve the test error significantly.
True | A model with more parameters is more prone to overfitting and typically has higher variance. | More model parameters increases the model's complexity, so it can more tightly fit data in training, increasing the chances of overfitting.
True | When debugging learning algorithms, it is useful to plot a learning curve to understand if there is a high bias or high variance problem. | The shape of a learning curve is a good indicator of bias or variance problems with your learning algorithm.
False | If a neural network has much lower training error than test error, then adding more layers will help bring the test error down because we can fit the test set better. | With lower training than test error, the model has high variance. Adding more layers will increase model complexity, making the variance problem worse.
