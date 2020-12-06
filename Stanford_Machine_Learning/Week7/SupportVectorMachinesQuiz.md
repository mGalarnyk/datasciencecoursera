# Machine Learning Week 7 Quiz 1 (Support Vector Machines) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ1p1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ1p2.png)

Answer | Explanation
--- | ---
It would be reasonable to try decreasing C. It would also be reasonable to try increasing  σ<sup>2</sup>  | The figure shows a decision boundary that is overfit to the training set, so we'd like to increase the bias / lower the variance of the SVM. We can do so by either decreasing the parameter C or increasing σ<sup>2</sup>

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p2.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p3.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p4.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p5.png)


Answer

![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p2Solution.png)

Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ3.png)

True/False | Answer | Explanation
--- | --- | ---
False | For every example with y<sup>(i)</sup>=1, we have that Θ<sup>T</sup>x<sup>(i)</sup>>= 0  | cost<sub>0</sub>(Θ<sup>T</sup>x<sup>(i)</sup>) is still non-zero for inputs between 0 and 1, so being greater than or equal to 0 is insufficient. 
False | For every example with y<sup>(i)</sup>=0, we have that Θ<sup>T</sup>x<sup>(i)</sup><= 0 | cost<sub>0</sub>(Θ<sup>T</sup>x<sup>(i)</sup>) is still non-zero for inputs between -1 and 0, so being less than or equal to 0 is insufficient. 
True | For every example with y<sup>(i)</sup>=0, we have that Θ<sup>T</sup>x<sup>(i)</sup><= -1  |  For examples with y<sup>(i)</sup>=0, only the cost<sub>0</sub>(Θ<sup>T</sup>x<sup>(i)</sup>) term is present. As you can see in the graph, this will be zero for all inputs greater than or equal to -1. 
True | For every example with y<sup>(i)</sup>=1, we have that Θ<sup>T</sup>x<sup>(i)</sup>>= 1  | For examples with y<sup>(i)</sup>=1,only the cost<sub>1</sub>(Θ<sup>T</sup>x<sup>(i)</sup>) term is present. As you can see in the graph, this will be zero for all inputs greater than or equal to 1. 

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ4.png)

True/False | Answer | Explanation
--- | --- | ---
False | Use an SVM with a linear kernel, without introducing new features.| An SVM with only the linear kernel is comparable to logistic regression, so it will likely underfit the data as well. 
True | Use an SVM with a Gaussian Kernel| By using a Gaussian kernel, your model will have greater complexity and you can avoid underfitting the data. 
False | Increase the regularization parameter λ | You are already underfitting the data and increasing the regularization parameter only makes underfitting stronger. 
True | Create / add new polynomial features | When you add more features, you increase the variance of your model, reducing your chances of underfitting. 
False | Use a different optimization method since gradient descent to train logisitic regression might result in a local minimum | The logistic regression cost function is convex, so gradient descent will always find the global minimum. 
True | Try using a neural network with a large number of hidden units | A neural network with many hidden units is a more complex (higher variance) model than logistic regression, so it is less likely to underfit the data. 

Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ5.png)

True/False | Answer | Explanation
--- | --- | ---
False | If the data are linear separable, an SVM using a linear kernel will return the same parameters Θ regardless of the chosen value of C (i.e., the resulting value of Θ does not depend on C)  | A linearly separable dataset can usually be separated by many different lines. Varying the parameter C will cause the SVM's decision boundary to vary among these possibilities. For example, for a very large value of C, it might learn larger values of Θ in order to increase the margin on certain examples. 
True | The maximum value of the Gaussian kernel (i.e., sim(x,l<sup>(1)</sup>)) is 1. | When x = l<sup>(1)</sup>, the Gaussian kernel has value exp(0) = 1, and it is less than 1 otherwise. 
True | Suppose you had 2D input examples (i.e. x<sup>(i)</sup> ∈ R<sup>2</sup>). The decision boundary of the SVM (with the linear kernel) is a straight line. | The SVM without any kernel (i.e., the linear kernel) predicts output based only Θ<sup>T</sup>x, so it gives a linear/straight-line decision boundary, just as logisitic regression does. 
False | If you are training multi-class SVMs with the one-vs-all method, it is not possible to use a kernel | Each SVM you train in the one-vs-all method is a standard SVM, so you are free to use a kernel. 
False | Suppose you are using SVMs to do multi-class classification and would likely to use the one-vs-all approach. If you have K different classes, you will train K-1 different SVMs. | The one-vs-all method requires that we have a separate classifier for every class, so you will train K different SVMs.
True | It is important to perform feature normalization before using the Gaussian kernel. | The similarity measure used by the Gaussian kernel expects that the data lie in approximately the same range.  
