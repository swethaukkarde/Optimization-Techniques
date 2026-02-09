% AIM:
% To find the maximum or minimum value of the function
% f(x) = x^3 - 6x^2 + 9x + 15

clc;
clear;
syms x

% Define the function
f = x^3 - 6*x^2 + 9*x + 15;

% First derivative
f1 = diff(f, x);

% Critical points (where f'(x) = 0)
critical_points = solve(f1 == 0, x);

% Second derivative
f2 = diff(f1, x);

% Display results
disp('Given Function f(x):');
disp(f)

disp('First Derivative f''(x):');
disp(f1)

disp('Critical Points:');
disp(critical_points)

disp('Second Derivative f''''(x):');
disp(f2)

% Classify each critical point
for i = 1:length(critical_points)
    cp = critical_points(i);
    value = subs(f2, x, cp);
    
    if value > 0
        fprintf('At x = %s, function has a Minimum\n', char(cp));
    elseif value < 0
        fprintf('At x = %s, function has a Maximum\n', char(cp));
    else
        fprintf('At x = %s, test is inconclusive\n', char(cp));
    end
end

% Plot the function
figure
fplot(f, [-2 6])
grid on
xlabel('x')
ylabel('f(x)')
title('Graph of f(x) = x^3 - 6x^2 + 9x + 15')