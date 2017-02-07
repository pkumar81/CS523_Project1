function max_lyapunovs = lyapunov2d(F, F_Jacobian, t_max, param1_range,...
param2, x0, y0)
current_l = 0;

for param1=param1_range
current_l = current_l + 1;

% Initialize variables
xy = [x0; y0]; xy_lengths = [1;0];
for i=1:t_max
J = F_Jacobian(xy, param1, param2); 
xy=F(xy, param1, param2);

% Calculate divergence rate in the direction defined by the Jacobian
xy_lengths=J*xy_lengths;
length=sqrt(sum(xy_lengths.^2)); % Distance formula
max_lyapunovs(current_l) = log(length)/i; % Calculate the average

end


end


end



%% initial values and commands

F = @(xy,a, b) [a-xy(1)^2+b*xy(2);xy(1)] % Duffling Map
F_Jacobian = @(xy,a, b) [-2*xy(1) b;1 0] % Duffling Jacobian
max_time = 500; % How long to run (= number of samples to average)
parameter1_range = 0.1:0.01:2; % Range over parameter 1: (a for Duffling Map)
parameter2 = 0.3; % Fix parameter 2 (b for Duffling Map)
% Initial values for x and y
x0 = 0.01
y0 = 0.01
% Calculate the maximum Lyapunov exponents
max_lyapunovs = lyapunov2d(F, F_Jacobian, max_time, parameter1_range,...
parameter2, x0, y0);
% Make a plot of the maximum exponents with a line at 0
plot(parameter1_range,max_lyapunovs, parameter1_range, 0, 'k.')
xlabel('Param1: a', 'FontSize', 24);
ylabel('\lambda_{max}', 'FontSize', 24);
