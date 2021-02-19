function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% J is the cost
J = 0;

%grad is gradiant
grad = zeros(size(theta));

% Below code computes the cost of a particular choice of theta.
%               J is set to the cost.
%               Partial derivatives are computed and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
%
%

J=(1/m) * sum((-y .* log(sigmoid(X*theta)))- ((1-y) .* log(1-sigmoid(X*theta))));

for j=1:size(theta)
    grad(j)=sum(((sigmoid(X*theta)-y).* X(:,j)))/ m;
end

% =============================================================

end
