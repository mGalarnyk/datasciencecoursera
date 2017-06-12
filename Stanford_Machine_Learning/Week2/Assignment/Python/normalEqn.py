import numpy as np 

def normalEqn(X, y):
#NORMALEQN Computes the closed-form solution to linear regression 
#   NORMALEQN(X,y) computes the closed-form solution to linear 
#   regression using the normal equations.
    
    theta = np.zeros((X.shape[1], 1))

# ====================== YOUR CODE HERE ======================
# Instructions: Complete the code to compute the closed form solution
#               to linear regression and put the result in theta.
#

# ---------------------- Sample Solution ----------------------

    theta = np.linalg.pinv(np.transpose(X).dot(X)).dot(np.transpose(X).dot(y))

    return theta

# -------------------------------------------------------------


# ============================================================
