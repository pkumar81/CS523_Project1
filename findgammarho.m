% We wrote this program to find the values of rho and gamma for fixed
% point, limit cycle, and complex behaviour
end_rho = [0.1,4.0];
end_gamma = [0.1,1.0];
n1=100;
n2=50; 
rhos = linspace(end_rho(1),end_rho(2),n1);
x=0.5;
y=1.0;
x_list = [];
t = 10000;
gammas = linspace(end_gamma(1),end_gamma(2),n2);
for rho=rhos
    for gamma = gammas
        [x_vals, y_vals] = drawxyplot(x,y,t,rho,gamma);
        x_list = [x_list; x_vals];
    end
end