%loading data
data = load('data1.txt');
X = data(:, [1, 2]); y = data(:, 3);
%plotting data
plotData(X, y);
xlabel('score of exam 1')
ylabel('scoreof exam 2')
legend('Admission', 'No admission')
%computing cost using cost function
%use matrix
[m,n]=size(X);
%Add an intercept term
X=[ones(m,1) X];
initial_theta = zeros(n + 1, 1);
[cost,gradient]=costFunction(initial_theta,X,y);
fprintf('Cost at initial theta %f\n', cost);
fprintf('Expected cost 0.693\n');
fprintf('Gradient at initial theta %f \n', gradient);
fprintf('Expected gradients \n -0.1000\n -12.0092\n -11.2628\n');
%with non zero theta
test_theta = [-24; 0.2; 0.2];
[cost, grad] = costFunction(test_theta, X, y);
fprintf('\nCost at test theta: %f\n', cost);
fprintf('Expected cost 0.218\n');
fprintf('Gradient at test theta: %f \n', grad);
fprintf('Expected gradients \n 0.043\n 2.566\n 2.647\n');
%optimization function
%use built in fuction
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);
  fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('Expected cost 0.203\n');
fprintf('theta: %f \n', theta);
fprintf('Expected theta -25.161\n 0.206\n 0.201\n');
plotDecision(theta, X, y);
xlabel('score of exam 1')
ylabel('scoreof exam 2')
legend('Admission', 'No admission')
%  Predict probability for a student with score 45 on exam 1 and score 85 on exam 2 
prob = sigmoid([1 45 85] * theta);
fprintf(['For a student with scores 45 and 85, we predict an admission probability of %f\n'], prob);
fprintf('Expected value: 0.775\n');
p = prediction(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Expected accuracy (approx): 89.0\n');
fprintf('\n');
%with 99 and 90 marks
prob = sigmoid([1 99 90] * theta);
fprintf(['For a student with scores 99 and 90, we predict an admission probability of %f\n'], prob);

%with 60 and 50 marks
prob = sigmoid([1 60 50] * theta);
fprintf(['For a student with scores 60 and 50, we predict an admission probability of %f\n'], prob);

