% draw the plot using x_vals, y_vals and t
%fixed foint
t = 50;
[x_vals, y_vals] = drawxyplot(1,1,t,0.2,0.3);
x_axis = 0:1:t;
y_axis = x_vals;
yyaxis left;
subplot(3,1,1), plot(x_axis,y_axis);
title('Fixed Point');
ylabel('X values');
xlabel('t values');
yyaxis right;
y_axis = y_vals;
subplot(3,1,1),plot(x_axis,y_axis,'--');
ylabel('Y values');

hold on;
[x_vals, y_vals] = drawxyplot(0,0,t,0.5,0.7);
x_axis = 0:1:t;
y_axis = x_vals;
yyaxis left;
subplot(3,1,2), plot(x_axis,y_axis);
title('Limit Cycle');
ylabel('X values');
xlabel('t values');
yyaxis right;
y_axis = y_vals;
subplot(3,1,2),plot(x_axis,y_axis,'--');
ylabel('Y values');

hold on;
t=5050;
[x_vals, y_vals] = drawxyplot(0,0,t,0.45,0.76);
x_axis = 5001:1:t;
y_axis = x_vals(5001:t);
yyaxis left;
subplot(3,1,3), plot(x_axis,y_axis);
title('Complex');
ylabel('X values');
xlabel('t values');
yyaxis right;
y_axis = y_vals(5001:t);
subplot(3,1,3),plot(x_axis,y_axis,'--');
ylabel('Y values');
