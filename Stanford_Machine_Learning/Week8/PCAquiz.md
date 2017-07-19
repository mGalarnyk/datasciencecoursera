# Machine Learning Week 8 Quiz 2 (Principle Component Analysis) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part2.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part3.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part4.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part5.png)

True or False | Statement | Explanation 
--- | --- | ---
False | Given historical weather records, predict if tomorrow's weather will be sunny or rainy | K-means cannot make classification predictions as it does not label its inputs.
True | Given a set of news articles from many different websites, find out what topics are the main topics covered | You can use K-means to cluster, and each cluster will correspond to a different market segment. 

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq2.png)

Answer | Explanation 
--- | --- 
c<sup>(i)</sup> = 1 | x<sup>(i)</sup> is closest to μ<sub>1</sub>, so c<sup>(i)</sup> = 1

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
