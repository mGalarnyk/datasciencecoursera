# Machine Learning Week 8 Quiz 2 (Principle Component Analysis) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part2.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part3.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part4.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part5.png)

Answer | Explanation 
--- | --- | ---
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part2.png" alt="Maximal variance image"> | The maximal variance is along the y = x line, so this option is correct.
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part3.png" alt="Maximal variance image"> | The maximal variance is along the y = x line, so the negative vector along that line is correct for the first principal component

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq2.png)

Answer | Explanation 
--- | --- 
Choose k to be the smallest value so that at least 99% of the variance is retained | This maintains the structure of the data while maximally reducing its dimension.


Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq3.png)

True or False | Statement | Explanation 
--- | --- | ---
False | Randomly initialize the cluster centroids | Done earlier
False | Test on the cross-validation set | Any sort of testing is outside the scope of K-means algorithm itself

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq4.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/ClusteringDistortionFunction.png" alt="Distortion Cost FUnction"> | This is the distortion cost function which we seek to minimize

Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq5.png)

True or False | Statement | Explanation 
--- | --- | ---
False | Once an example has been assigned to a particular centroid, it will never be reassigned to another centroid | Not sure yet
True | A good way to initialize K-means is to select K (distinct) examples from the training set and set the cluster centroids equal to these selected examples. | This is the recommended method of initialization.
