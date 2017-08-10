# Machine Learning Week 8 Quiz 2 (Principle Component Analysis) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part2.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part3.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part4.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq1part5.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAQ1answer1.png" alt="Maximal variance image"> | The maximal variance is along the y = x line, so this option is correct.
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAQ1answer2.png" alt="Maximal variance image"> | The maximal variance is along the y = x line, so the negative vector along that line is correct for the first principal component

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq2.png)

Answer | Explanation 
--- | --- 
Choose k to be the smallest value so that at least 99% of the variance is retained | This maintains the structure of the data while maximally reducing its dimension.


Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq3.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq3Answer.png" alt="Maximal variance image"> | It is just a formula. 

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq4.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq4Answer1.png" alt="PCA Q4 Answer 1"> | If you do not perform mean normalization, PCA will rotate the data in a possibly undesired way.
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq4Answer2.png" alt="PCA Q4 Answer 2"> | None needed

Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/PCAq5.png)

True or False | Statement | Explanation 
--- | --- | ---
False | Data visualization: To take 2D data, and find a different way of plotting it in 2D (using k=2) | None needed
False | As a replacement for (or alternative to) linear regression: For most learning applications, PCA and linear regression give substantially similar results | PCA is not linear regression. They have different goals (and cost functions), so they give different results.
True | Data compression: Reduce the dimension of your input data x<sup>(i)</sup>, which will be used in a supervised learning algorithm (i.e., use PCA so that your supervised learning algorithm runs faster) | If your learning algorithm is too slow because the input dimension is too high, then using PCA to speed it up is a reasonable choice.
True | Data compression: Reduce the dimension of your data, so that it takes up less memory/disk space. | If memory or disk space is limited, PCA allows you to save space in exchange for losing a little of the data's information. This can be a reasonable tradeoff.

