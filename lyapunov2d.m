function [max_lyapunovs,rho_max_lyapunovs, max_max_lyapunovs] = lyapunov2d(F, F_Jacobian, t_max, rho_range,...
gammar, x0, y0)
current_l = 0;
max_max_lyapunovs=-10; 
rho_max_lyapunovs=0;

for rho=rho_range
current_l = current_l + 1;

% Initialize variables
xy = [x0; y0]; xy_lengths = [1;0];

for i=1:t_max
J = F_Jacobian(xy, rho, gammar); 
xy=F(xy, rho, gammar);

% Calculate divergence rate in the direction defined by the Jacobian
xy_lengths=J*xy_lengths;
length=sqrt(sum(xy_lengths.^2)); % Distance formula
max_lyapunovs(current_l) = log(length)/i; % Calculate the average
end

temp=nanmax(max_lyapunovs);
if max_max_lyapunovs < nanmax(max_lyapunovs)
    max_max_lyapunovs=temp;
    rho_max_lyapunovs=rho;
end 

end
fprintf('The largest max_laypunovs is .%d\n', max_max_lyapunovs);
fprintf('Rho is %d with the largest max_laypunovs.\n', rho_max_lyapunovs);
end




