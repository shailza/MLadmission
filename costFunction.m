function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));
j1=-1*(y.*log(sigmoid(X*theta)));
j2=(1-y).*log(1-sigmoid(X*theta));
J=sum(j1-j2)/m;
grad=(X'*(sigmoid(X*theta)-y))*(1/m);
end









