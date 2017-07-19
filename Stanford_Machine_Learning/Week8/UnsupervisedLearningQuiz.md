# Machine Learning Week 8 Quiz 1 (Unsupervised Learning) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/unsupervisedLearningQ1.png)

True or False | Statement | Explanation 
--- | --- | ---
False | Given historical weather records, predict if tomorrow's weather will be sunny or rainy | K-means cannot make classification predictions as it does not label its inputs.
True | Given a set of news articles from many different websites, find out what topics are the main topics covered | You can use K-means to cluster, and each cluster will correspond to a different market segment. 
True | From the user usage patterns on a website, figure out what different groups of users exists. | You can use K-means to cluster users with each cluster corresponding to a different market segment. 
False | Given many emails, you want to determine if they are Spam or Non-Spam emails.  | K-means cannot make classification predictions as it does not label its inputs

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/unsupervisedLearningQ2.png)

Answer | Explanation 
--- | --- 
c<sup>(i)</sup> = 1 | x<sup>(i)</sup> is closest to μ<sub>1</sub>, so c<sup>(i)</sup> = 1

Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/unsupervisedLearningQ3.png)

True or False | Statement | Explanation 
--- | --- | ---
True | Randomly initialize the cluster centroids |
False | Test on the cross-validation set | Any sort of testing is outside the scope of K-means algorithm itself
True | Move the cluster centroids, where the centroids, μ<sub>k</sub> are updated | The cluster update is the second step of the K-means loop 
True | The cluster assignment step, where the parameters c<sup>(i)</sup> are updated | The cluster update is the second step of the K-means loop.

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/unsupervisedLearningQ4.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/ClusteringDistortionFunction.png" alt="Distortion Cost FUnction"> | This is the distortion cost function which we seek to minimize

Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/unsupervisedLearningQ5.png)

True or False | Statement | Explanation 
--- | --- | ---
False | Given historical weather records, predict if tomorrow's weather will be sunny or rainy | K-means cannot make classification predictions as it does not label its inputs.
True | Given a set of news articles from many different websites, find out what topics are the main topics covered | You can use K-means to cluster, and each cluster will correspond to a different market segment. 
True | From the user usage patterns on a website, figure out what different groups of users exists. | You can use K-means to cluster users with each cluster corresponding to a different market segment. 
False | Given many emails, you want to determine if they are Spam or Non-Spam emails.  | K-means cannot make classification predictions as it does not label its inputs


K-Means will always
give the same results
regardless of the
initialization of the
centroids.

