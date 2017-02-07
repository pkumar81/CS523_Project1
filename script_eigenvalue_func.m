F = @(xy,a, b) [a-xy(1)^2+b*xy(2);xy(1)] % Duffling Map
F_Jacobian = @(xy,a, b) [-2*xy(1) b;1 0] % Duffling Jacobian
max_time = 500; % How long to run (= number of samples to average)
rho_range= [0.2 0.37 0.4 0.91 0.10 0.102 1.03 1.05 1.2 1.23 1.25 1.26]; % Range over parameter 1: (a for Duffling Map)
gammar = 0.3; % Fix parameter 2 (b for Duffling Map)
% Initial values for x and y
x0 = 0.3;
y0 = 0.01;
[eigenvalue1, eigenvalue2]=eigenvalue(F, F_Jacobian, max_time,rho_range, gammar, x0, y0)