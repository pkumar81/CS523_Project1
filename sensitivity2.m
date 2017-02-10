function sensitivity2(a0, b0, c0, t_max, x0, x1)
% Sensitivity to initial condition
% Reference code is here https://www.mathworks.com/matlabcentral/fileexchange/56600-the-rossler-attractor--chaotic-simulation
% a0, b0, c0 are beta,alpha and gamma respectively
% t_max is upper limit of tspan parameter of ode45 function of matlab
% x0, and x1 are the initial condition of the given system
    a=a0;b=b0;c=c0;
    t0 = [0 t_max];
    f = @(t, x) [x(1)*x(2) - x(1)*c + b; -(x(1) + x(3)); a*x(3) + x(2)]; %x(1)=x, x(2)=y, x(3)=z
    % first condition
    [T1,X1] = ode45(f,t0,x0);
    % second condition
    [T2,X2] = ode45(f,t0,x1); 
    figure;
    subplot(3,1,1);
    plot(T1,X1(:,1),'-b*','MarkerSize',2); hold on
    plot(T2,X2(:,1), '-r','LineWidth',1); 
    xlabel('t','FontSize', 11); ylabel('X','FontSize', 11);
    title('Sensitivity to Initial Condition X Vs t','FontSize', 11);
    hold off
    
    subplot(3,1,2);
    plot(T1,X1(:,2),'-b*','MarkerSize',2); hold on
    plot(T2,X2(:,2),'-r','LineWidth',1); 
    xlabel('t','FontSize', 11); ylabel('Y','FontSize', 11);
    title('Sensitivity to Initial Condition Y Vs t','FontSize', 11);
    hold off
    
    subplot(3,1,3);
    plot(T1,X1(:,3),'-b*','MarkerSize',2); hold on
    plot(T2,X2(:,3),'-r','LineWidth',1); 
    xlabel('t','FontSize', 11); ylabel('Z','FontSize', 11);
    title('Sensitivity to Initial Condition Z Vs t','FontSize', 11);
    hold off
end

