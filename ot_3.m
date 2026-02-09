% Gradient Descent for minimizing f(x) = (x - 3)^2

% Define parameters
x = 0;              % Initial value
alpha = 0.1;        % Learning rate
iterations = 3;     % Number of iterations

fprintf('Iteration\t x value\t f(x)\n');

for i = 1:iterations
    % Gradient of the function f(x) = (x-3)^2
    gradient = 2 * (x - 3);
    
    % Update x using gradient descent formula
    x = x - alpha * gradient;
    
    % Compute function value
    fx = (x - 3)^2;
    
    % Display results
    fprintf('%d\t\t %.4f\t %.4f\n', i, x, fx);
end
