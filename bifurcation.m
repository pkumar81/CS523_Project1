function D = bifurcation(x0, y0, gamma, param_range, n_samples, t_max)
% this function takes the values of the parameters and returns the points
% for the bifurcation plot.
transient_time = 100; % capture values after transient time to make sure we are in the fixed point’s basin 
param_values = linspace(param_range(1), param_range(2), n_samples);
% iterate from p=0.5 to p=1.4 and compute the values of x and y for the
% bifurcation plot.
D = [];
for p = param_values
    x(1) = x0;
    y(1) = y0;
    for t = 1:t_max
        x(t+1) = p - x(t)^2 + gamma*y(t);
        y(t+1) = x(t);
        if t > transient_time  %Wait until the transient period is over 
            D = [D;p x(t)];
        end
    end
end
end


