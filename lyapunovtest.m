x0 = 0.5; % An initial value for the bifurcation plot
y0 = 0.1;
n_samples = 250 % Number of points to plot
param_range = [0.5,2.4] % Parameter range to plot, r for the logistic map
gamma = 0.3;
transient_time = 500 % Make sure we are in the fixed point’s basin
max_time = 1000 % This minus the transient time is the number
% of Lyapunov samples to average over
% Calculate the Lyapunov exponents
ls = lyapunov(x0, y0, n_samples, param_range, gamma, transient_time, max_time);
plot(linspace(param_range(1), param_range(2), n_samples), ls, 'b-');
