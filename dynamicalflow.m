% this program calls functions to generate plots for part 2 of the
% assignment
a0=0.2;b0=0.2;c0=5.7;
x0 = [0.1 0.2 0.3];
x1 = [0.1005 0.2 0.3];
t_max=200;
sensitivity2(a0, b0, c0, t_max, x0, x1); % plot for sensitivity to initial condition

t_max=500;
t_trans = 100;
x0 =[1 1 0];
attractor2(a0,b0,c0,t_max,x0); % 3D and 2D diagram for attractor with fixed points

a0=0.38; % beta
b0=2;  %alpha 
c0=5.7; %gamma
a_bifurcation(a0, b0, c0, t_max, t_trans, x0); % bifurcation using parameter beta

a0=0.2; % beta
b0=2;  %alpha 
c0=5.7; %gamma
b_bifurcation(a0, b0, c0, t_max, t_trans, x0); % bifurcation using parameter alpha

a0=0.2; % beta
b0=0.2;  %alpha 
c0=15; %gamma
c_bifurcation(a0, b0, c0, t_max, t_trans, x0); % bifurcation using parameter gamma
