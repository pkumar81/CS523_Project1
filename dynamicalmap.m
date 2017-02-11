%This program is calls functions to generate plots for part 1
% draw the plot using x_vals, y_vals and t
%  plots for Dynamical Regimes
%fixed foint
clc;clear;
t = 100;
x=0.5;
y=1.0;
rho=0.1394;
gamma = 0.1735;
[x_vals, y_vals] = drawxyplot(x,y,t,rho,gamma);
x_axis = 0:1:t;
y_axis = x_vals;
yyaxis left;
subplot(3,1,1), plot(x_axis,y_axis,'b');
title('1a. Fixed Point','FontSize', 10);
ylabel('X values','FontSize', 10);
xlabel('t values','FontSize', 10);
yyaxis right;
y_axis = y_vals;
subplot(3,1,1),plot(x_axis,y_axis,'--r');
ylabel('Y values');

hold on;
%rho=0.1;
%gamma = 0.7796;
rho = 1.0455;
gamma = 0.2469;
[x_vals, y_vals] = drawxyplot(x,y,t,rho,gamma);
x_axis = 0:1:t;
y_axis = x_vals;
yyaxis left;
subplot(3,1,2), plot(x_axis,y_axis,'b');
title('1b. Limit Cycle', 'FontSize', 10);
ylabel('X values', 'FontSize', 10);
xlabel('t values', 'FontSize', 10);
yyaxis right;
y_axis = y_vals;
subplot(3,1,2),plot(x_axis,y_axis,'--r');
ylabel('Y values');

hold on;
t=9100;
rho=1.1242;
gamma = 0.4673;
[x_vals, y_vals] = drawxyplot(x,y,t,rho,gamma);
x_axis = 9001:1:t;
y_axis = x_vals(9001:t);
yyaxis left;
subplot(3,1,3), plot(x_axis,y_axis,'b');
title('1c. Complex','FontSize', 10);
ylabel('X values','FontSize', 10);
xlabel('t values','FontSize', 10);
yyaxis right;
y_axis = y_vals(9001:t);
subplot(3,1,3),plot(x_axis,y_axis,'--r');
ylabel('Y values');
hold off;


clc;clear;
figure;
% plots for Bifurcations
gamma = 0.3;    % gamma
t_max = 200;    % number of iterations
x0 = 0.75;  % initial value of x
y0 = 0.25;  % initial values of y
param_range = [0.2,1.4]; %start and end values of p
n_samples = 450; % Number of points to plot 
D = bifurcation(x0, y0, gamma, param_range, n_samples, t_max);
plot(D(:,1),D(:,2),'.');
title('Bifurcation diagram x Vs rho','FontSize', 13);
xlabel('rho','FontSize', 13);
ylabel('x','FontSize', 13);
hold off;


clc;clear;
%plot for sensitivity to initial conditions
drawSensitivityDiagram(0.555,0.012,0.553,0.010,100);
hold off;

clc;clear;
figure;
%plots for Lyapunov Exponent
F = @(xy,a, b) [a-xy(1)^2+b*xy(2);xy(1)] % Duffling Map
F_Jacobian = @(xy,a, b) [-2*xy(1) b;1 0] % Duffling Jacobian
max_time = 500; % How long to run (= number of samples to average)
rho_range = 0:0.001:1.6; % Range over parameter 1: (a for Duffling Map)
gammar = 0.3; % Fix parameter 2 (b for Duffling Map)
% Initial values for x and y
x0 = 0.3;
y0 = 0.01;
% Calculate the maximum Lyapunov exponents
[max_lyapunovs,rho_max_lyapunovs, max_max_lyapunovs] = lyapunov2d(F, F_Jacobian, max_time, rho_range,...
gammar, x0, y0);
%figure(4)
% Make a plot of the maximum exponents with a line at 0
plot(rho_range,max_lyapunovs, rho_range, 0, 'k.')
xlabel('\rho','FontSize',11);
ylabel('\lambda_{max}','FontSize',12);
title('Lyapunov Exponent','FontSize',12);
grid on;



