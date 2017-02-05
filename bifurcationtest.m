gamma = 0.3;    % gamma
t_max = 500;    % number of iterations
x0 = 0.5;  % initial value of x
y0 = 0.1;  % initial values of y
param_range = [0.5,1.4]; %start and end values of p
n_samples = 250; % Number of points to plot 
[bx, by] = bifurcation(x0, y0, gamma, param_range, n_samples, t_max);
plot(bx,by,'.');



