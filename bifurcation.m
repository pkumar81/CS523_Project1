clear;
p_start = 0.5;  % start of p
p_end = 1.4;    % end of p
gamma = 0.3;    % gamma
t_max = 500;    % number of iterations
points_max = t_max/2; % number of points for the plot
idx = 0;    %index for x and y values for bifurcation plot
x0 = 0.5;  % initial value of x
y0 = 0.1;  % initial values of y

% iterate from p=0.5 to p=1.4 and compute the values of x and y for the
% bifurcation plot.
for p = p_start:0.005:p_end
    x(1) = x0;
    y(1) = y0;
    for t = 1:t_max
        x(t+1) = p - x(t)^2 + gamma*y(t);
        y(t+1) = x(t);
        if t > points_max
            idx = idx+1;
            by(idx) = x(t);
            bx(idx) = p;
        end
    end
    idx = idx+1;    % don't leave the last value
    by(idx) = x(t+1);
    bx(idx) = p;
end
plot(bx,by,'.');



