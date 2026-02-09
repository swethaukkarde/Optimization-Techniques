clc;
clear;

% Declare symbolic variables
syms x y

% Given function
f = x^2 + y^2 - 4*x - 6*y + 13;

% First order partial derivatives
fx = diff(f, x);
fy = diff(f, y);

% Solve fx = 0 and fy = 0
sol = solve([fx == 0, fy == 0], [x, y]);

x0 = sol.x;
y0 = sol.y;

% Second order partial derivatives
fxx = diff(fx, x);
fyy = diff(fy, y);
fxy = diff(fx, y);

% Hessian determinant
D = fxx*fyy - fxy^2;

% Substitute critical point
Dval = subs(D, [x y], [x0 y0]);
fxxval = subs(fxx, [x y], [x0 y0]);
fval = subs(f, [x y], [x0 y0]);

% Display results
fprintf('Critical Point: (%.0f, %.0f)\n', x0, y0);

if Dval > 0 && fxxval > 0
    disp('Nature: Local Minimum')
elseif Dval > 0 && fxxval < 0
    disp('Nature: Local Maximum')
else
    disp('Nature: Saddle Point')
end

fprintf('Minimum Value: f(%d,%d) = %.0f\n', x0, y0, fval);
