# Machine Learning Week 7 Quiz 1 (Support Vector Machines) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ1p1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ1p2.png)

Answer | Explanation
--- | ---
It would be reasonable to try decreasing C. It would also be reasonable to try decreasing  σ<sup>2</sup>  | The figure shows a decision boundary that is overfit to the training set, so we'd like to increase the bias / lower the variance of the SVM. We can do so by either decreasing the parameter C or increasing σ<sup>2</sup>


False | Suppose you have a multi-class classification problem with three classes, trained with a 3 layer network. Let a<sup>(3)</sup><sub>1</sub>=(h<sub>Θ</sub>(x))<sub>1</sub> be the activation of the first output unit, and similarly a<sup>(3)</sup><sub>2</sub>=(h<sub>Θ</sub>(x))<sub>2</sub> and a<sup>(3)</sup><sub>3</sub>=(h<sub>Θ</sub>(x))<sub>3</sub>. Then for any input x, it must be the case that a<sup>(3)</sup><sub>1</sub>+a<sup>(3)</sup><sub>2</sub>+a<sup>(3)</sup><sub>3</sub>=1. | The outputs of a neural network are not probabilities, so their sum need not be 1. 
True | The activation values of the hidden units in a neural network, with the sigmoid activation function applied at every layer, are always in the range (0, 1). | None Needed


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
True | For every example with y<sup>(i)</sup>=0, we have that Θ<sup>T</sup>x<sup>(i)</sup>>= -1  |  For examples with y<sup>(i)</sup>=0, only the cost<sub>0</sub>(Θ<sup>T</sup>x<sup>(i)</sup>) term is present. As you can see in the graph, this will be zero for all inputs greater than or equal to -1. 
True | For every example with y<sup>(i)</sup>=1, we have that Θ<sup>T</sup>x<sup>(i)</sup>>= 1  | For examples with y<sup>(i)</sup>=1,only the cost<sub>1</sub>(Θ<sup>T</sup>x<sup>(i)</sup>) term is present. As you can see in the graph, this will be zero for all inputs greater than or equal to 1. 

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ4.png)

True/False | Answer | Explanation
--- | --- | ---
none yet | Use an SVM with a linear kernel, without introducing new features.| none yet
none yet | Use an SVM with a Gaussian Kernel| none yet
False | Increase the regularization parameter λ | You are already underfitting the data and increasing the regularization parameter only makes underfitting stronger. 
True | Create / add new polynomial features | When you add more features, you increase the variance of your model, reducing your chances of underfitting. 
False | Use a different optimization method since gradient descent to train logisitic regression might result in a local minimum | The logistic regression cost function is convex, so gradient descent will always find the global minimum. 
True | Try using a neural network with a large number of hidden units | A neural network with many hidden units is a more complex (higher variance) model than logistic regression, so it is less likely to underfit the data. 

Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ5.png)

True/False | Answer | Explanation
--- | --- | ---
none yet | If the data are linear separable, an SVM using a linear kernel will return the same parameters Θ regardless of the chosen value of C (i.e., the resulting value of Θ does not depend on C)  | none yet
none yet | The maximum value of the Gaussian kernel (i.e., sim(x,l<sup>(1)</sup>)) is 1. | none yet
none yet | Suppose you had 2D input examples (i.e. x<sup>(i)</sup> ∈ R<sup>2</sup>). The decision boundary of the SVM (with the linear kernel) is a straight line. | none yet
none yet | If you are training multi-class SVMs with the one-vs-all method, it is not possible to use a kernel | none yet
