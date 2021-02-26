function [all_theta] = oneVsAll(X, y, num_labels, lambda)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for label i
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logisitc regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i

% Some useful variables
m = size(X, 1);
n = size(X, 2);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1); % 10 * 401

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the following code to train num_labels
%               logistic regression classifiers with regularization
%               parameter lambda. 
%
% Hint: theta(:) will return a column vector.
%
% Hint: You can use y == c to obtain a vector of 1's and 0's that tell use 
%       whether the ground truth is true/false for this class.
%
% Note: For this assignment, we recommend using fmincg to optimize the cost
%       function. It is okay to use a for-loop (for c = 1:num_labels) to
%       loop over the different classes.
%
%       fmincg works similarly to fminunc, but is more efficient when we
%       are dealing with large number of parameters.
%
% Example Code for fmincg:
%
     % Set Initial theta
     initial_theta = zeros(n + 1, 1);
     
     % Set options for fminunc
     options = optimset('GradObj', 'on', 'MaxIter', 50);
 
     % Run fmincg to obtain the optimal theta
     % This function will return theta and the cost 
     
     % Variable 'X' contains data in dimension (5000 * 400). 
     % 5000 = Total no. of training examples, 400 = 400 pixels / training sample (digit image)
     % Total no. Features  = 400
     
    for c = 1:num_labels 
        all_theta(c,:) = fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), initial_theta, options);
        % remember y (5000*1) is an array of labels i.e. it contains actual 
        % digit names (y==c) will return a vector with values 0 or 1. 1 at places where y==c 
        
        % 't' is passed as dummy parameter which is initialized with 'initial_theta' first
        % then subsequent values are choosen by fmincg [Note: Its not a builtin function like fminunc
        
        % fmincg will consider all training data having label c (1-10 note
        % 0 is mapped to 10) and find the optimal theta vector for it (Classifying white pixels with gray pixels). same
        % process is repeated for other classes
    end
end
