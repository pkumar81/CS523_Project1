% code is refered from website http://www.math.le.ac.uk/people/rld8/ma1251/lab3.html
% Npre, the number of orbit points we want to discard (number of pre-iterates),  
% Nplot, the number of orbit points we want to plot for each value of parameter r (number of iterates).

Npre = 500; Nplot = 200; 

%efines x and y as a Matlab array with Nplot rows and 1 column,respectively.

x = zeros(Nplot,1); 
y = zeros(Nplot,1);

% p ranges from 0.5 to 1.4 by intervel of 0.005

for p = 0.5:0.005:1.4, 
  x(1) = 0.05;                   % initial value for x
  y(1) = 0.01;                   % initial value for y
  
   % iterate to caculate x(n) and y(n),  put them as initial values for the next loop
   
  for n = 1:Npre,
    y(2)=x(1);
    x(2)=p-x(1)^2+0.3*y(1); 
    y(1)=y(2);
    x(1)=x(2);
  end, 
  for n = 1:Nplot-1,                  % iterate to caculate x(n) and y(n)
    y(n+1)=x(n);
    x(n+1) =p-x(n)^2+0.3*y(n); 
  end, 
  plot(p*ones(Nplot,1), y, '.');       %plot y to p
  hold on; 
end, 
title('Bifurcation diagram'); 
xlabel('r');  ylabel('y_n'); 
hold off;