# Machine Learning Week 7 Quiz 1 (Support Vector Machines) Stanford Coursera

Question 1
----------
![](https://github.com/Jamiil92/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ1p1n.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ1p2.png)

Answer | Explanation
--- | ---
It would be reasonable to try increasing C. It would also be reasonable to try decreasing σ<sup>2</sup>. | The figure shows a decision boundary that is underfit to the training set, so we'd like to lower the bias / increase the variance of the SVM. We can do so by either increasing the parameter C or decreasing σ<sup>2</sup>.

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p2.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p3.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p4.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ2p5.png)

Answer | Explanation
--- | ---
Figure 3 |This figure shows a "narrower" Gaussian kernel centered at the same location which is the effect of decreasing σ<sup>2</sup>.

Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ3.png)

True/False | Answer | Explanation
--- | --- | ---
False | For every example with y<sup>(i)</sup> = 1, we have that θ<sup>T</sup> x<sup>(i)</sup> >= 0 | none
False | For every example with y<sup>(i)</sup> = 0, we have that θ<sup>T</sup> x<sup>(i)</sup> <= 0 | none
True  | For every example with y<sup>(i)</sup> = 0, we have that θ<sup>T</sup> x<sup>(i)</sup> <= -1  | For examples with y<sup>(i)</sup> = 0, only the cost<sub>0</sub>(θ<sup>T</sup> x<sup>(i)</sup>) term is present. As you can see in the graph, this will be zero for all inputs less than or equal to -1.
True  | For every example with y<sup>(i)</sup> = 1, we have that θ<sup>T</sup> x<sup>(i)</sup> >= 1 | For examples with y<sup>(i)</sup> = 1, only the cost<sub>0</sub>(θ<sup>T</sup> x<sup>(i)</sup>) term is present. As you can see in the graph, this will be zero for all inputs greater than or equal to 1.

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/SupportVectorMachinesQ4.png)

True/False | Answer | Explanation
--- | --- | ---
False | Use an SVM with a linear kernel, without introducing new features. | none 
True  | Use an SVM with a Gaussian Kernel. | By using a Gaussian kernel, your model will have greater complexity and can avoid underfitting the data.
False | Increase the regularization parameter λ. | none 
True  | Create / add new polynomial features. | When you add more features, you increase the variance of your model, reducing the chances of underfitting.

Question 5
----------

Which of the following statements are true? Check all that apply.

* The maximum value of the Gaussian kernel (i.e., sim(x, l<sup>(1)</sup>) is 1.

*  If the data are linearly separable, an SVM using a linear kernel will return the same parameters θ regardless of the chosen value of C (i.e., the resulting value of θ  does not depend on C).

* It is important to perform feature normalization before using the Gaussian kernel.

* Suppose you are using SVMs to do multi-class classification and would like to use the one-vs-all approach. If you have K different classes, you will train K - 1 different SVMs.


True/False | Answer | Explanation
--- | --- | ---
True  | The maximum value of the Gaussian kernel (i.e., sim(x, l<sup>(1)</sup>) is 1. | When x = l<sup>(1)</sup>, the Gaussian kernel has value exp(0)=1, and it is less than 1 otherwise.
False | If the data are linearly separable, an SVM using a linear kernel will return the same parameters θ regardless of the chosen value of C (i.e., the resulting value of θ does not depend on C). | none 
True  | It is important to perform feature normalization before using the Gaussian kernel. | The similarity measure used by the Gaussian kernel expects that the data lie in approximately the same range.
False | Suppose you are using SVMs to do multi-class classification and would like to use the one-vs-all approach. If you have K different classes, you will train K - 1 different SVMs. | none 

