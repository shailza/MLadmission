function p = prediction(theta, X)
m = size(X, 1); % Number of training examples
p = zeros(m, 1);
res=sigmoid(X*theta);
p=round(res);
end
