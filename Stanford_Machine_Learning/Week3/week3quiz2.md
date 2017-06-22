# Machine Learning Week 3 Quiz 2 (Regularization) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationQ1.png)

True or False | Statement | Explanation 
--- | --- | ---
False | Adding many new features to the model helps prevent overfitting on the training set. | Adding many new features gives us more expressive models which are able to better fit our training set. If too many new features are added, this can lead to overfitting of the training set.
False | Introducing regularization to the model always results in equal or better performance on examples <b> not </b> in the training set. | If we introduce too much regularization, we can underfit the training set and this can lead to worse performance even for examples not in the training set.
False | Introducing regularization to the model always results in equal or better performance on the training set. | If we introduce too much regularization, we can underfit the training set and have worse performance on the training set.
True | Adding a new feature to the model always results in equal or better performance on the training set | Adding many new features gives us more expressive models which are able to better fit our training set. If too many new features are added, this can lead to overfitting of the training set.

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationQ2.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationQ2imageAnswer.png" alt="Answer Image"> | Adding many new features to the model helps prevent overfitting on the training set. 

Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationQ3.png)

True or False | Statement | Explanation 
--- | --- | ---
False | Using a very large value λ cannot hurt the performance of your hypothesis; the only reason we do not set to be too large is to avoid numerical problems. | Using a very large value of λ can lead to underfitting of the training set.
False | Because regularization causes J(θ) to no longer be convex, gradient descent may not always converge to the global minimum (when λ > 0, and when using an appropriate learning rate α). | Regularized logistic regression and regularized linear regression are both convex, and thus gradient descent will still converge to the global minimum.
True | Using too large a value of λ can cause your hypothesis to underfit the data.| A large value of results in a large λ regularization penalty and thus a strong preference for simpler models which can underfit the data.
False | Because logistic regression outputs values 0 <= h<sub>0</sub> <= 1, its range of output values can only be "shrunk" slighly by regularization anyway, so regularization is generally not helpful for it.  | None needed

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationQ4p1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationQ4p2.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationq4imageAnswer.png" alt="Answer Image"> | The hypothesis follows the data points very closely and is highly complicated, indicating that it is overfitting the training set

Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationQ5p1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationQ5p2.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationq5imageAnswer.png" alt="Answer Image"> | The hypothesis does not predict many data points well, and is thus underfitting the training set.

