# Machine Learning Week 4 Quiz 1 (Neural Networks: Representation) Stanford Coursera

Question 1
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/NeuralRepresentationQ1.png)

True or False | Statement | Explanation 
--- | --- | ---
False | A two layer (one input layer, one output layer; no hidden layer) neural network can represent the XOR function. | We must compose multiple logical operations by using a hidden layer to represent the XOR function. 
True | Any logical function over binary-valued (0 or 1) inputs x<sub>1</sub> and x<sub>2</sub> can be (approximately) represented using some neural network. | Since we can build the basic AND, OR, and NOT functions with a two layer network, we can (approximately) represent any logical function by composing these basic functions over multiple layers.
False | Suppose you have a multi-class classification problem with three classes, trained with a 3 layer network. Let a<sup>(3)</sup><sub>1</sub>=(h<sub>Θ</sub>(x))<sub>1</sub> be the activation of the first output unit, and similarly a<sup>(3)</sup><sub>2</sub>=(h<sub>Θ</sub>(x))<sub>2</sub> and a<sup>(3)</sup><sub>3</sub>=(h<sub>Θ</sub>(x))<sub>3</sub>. Then for any input x, it must be the case that a<sup>(3)</sup><sub>1</sub>+a<sup>(3)</sup><sub>2</sub>+a<sup>(3)</sup><sub>3</sub>=1. | The outputs of a neural network are not probabilities, so their sum need not be 1. 
True | The activation values of the hidden units in a neural network, with the sigmoid activation function applied at every layer, are always in the range (0, 1). | None Needed

Question 2
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/NeuralRepresentationQ2.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationQ2imageAnswer.png" alt="Answer Image"> | Adding many new features to the model helps prevent overfitting on the training set. 

Question 3
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/NeuralRepresentationQ3.png)

True or False | Statement | Explanation 
--- | --- | ---
TBA | TBA| TBA

Question 4
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/NeuralRepresentationQ4p1.png)
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/NeuralRepresentationQ4p2.png)

Answer | Explanation 
--- | --- 
<img src="https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/regularizationq4imageAnswer.png" alt="Answer Image"> | The hypothesis follows the data points very closely and is highly complicated, indicating that it is overfitting the training set

Question 5
----------
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/Stanford_Machine_Learning/Week1/data/NeuralRepresentationQ5.png)

