function c_bifurcation(a0, b0, c0, t_max, t_trans, x0)
% Reference code is here https://www.mathworks.com/matlabcentral/fileexchange/56600-the-rossler-attractor--chaotic-simulation
% a, b, c are beta, alpha, and gamma respectively. a, b will remain
% fixed and c will vary.
% x0 is the initial condition of the given system
    a=a0; b=b0;
    crange = 1:0.05:c0;       % Range for parameter a
    tspan = 0:0.1:t_max;
    transient_time = t_trans;
    D = [];   % matrix for storing data points for bifurcation plot
    for c = crange 
        f = @(t, x) [x(1)*x(2) - x(1)*c + b; -(x(1) + x(3)); a*x(3) + x(2)]; %x(1)=x, x(2)=y, x(3)=z
        [t,X] = ode45(f,tspan,x0);       
        idx = find(t>transient_time);  % find all the t_values which are > transient_time 
        x = X(idx,:); 
        n = size(x,1);
        for i = 2:n-1  %sort x in increasing order
             if((x(i,2)>x(i-1,2))&&(x(i,2)>x(i+1,2)))
                D=[D; c x(i,2)];
            end 
        end 
    end 
    figure;
    plot(D(:,1),D(:,2),'k.'); hold on
    xlabel('c','FontSize', 11);
    ylabel('y','FontSize', 11);
    title('Bifurcation plot using parameter c','FontSize', 11); 
    hold off
end

