import matplotlib.pyplot as plt

def plotData(x, y):
#PLOTDATA Plots the data points x and y into a new figure 
#   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
#   population and profit.

# ====================== YOUR CODE HERE ======================
# Instructions: Plot the training data into a figure using the 
#               "figure" and "plot" commands. Set the axes labels using
#               the "xlabel" and "ylabel" commands. Assume the 
#               population and revenue data have been passed in
#               as the x and y arguments of this function.


    # fig = plt.figure() # open a new figure window
    

    plt.plot(x,y,'rx', markersize=10, label='Training data')
    plt.xlabel('Population of City in 10,000s')
    plt.ylabel('Profit in $10,000s')
    plt.show(block=False) # prevents having to close the graph to move forward with ex1.py

# ============================================================
