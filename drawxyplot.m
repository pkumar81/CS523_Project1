function drawxyplot(x,y,t,phi,gamma)
    %store the initial values x0,y0
    x_vals = [x]; 
    y_vals = [y];
    
    %iterate through all values of t to compute the values of x and y
    for i = 1:t
        y_new = x;
        y_vals = [y_vals y_new];
        x_new = phi - x^2 + gamma*y;
        x_vals = [x_vals x_new];
        x = x_new;
        y = y_new;
    end

% draw the plot using x_vals, y_vals and t
x_axis = 0:1:t;
y_axis = x_vals;
yyaxis left;
plot(x_axis,y_axis);
title('2D Dynamical Regimes');
ylabel('X values');
xlabel('t values');
yyaxis right;
y_axis = y_vals;
plot(x_axis,y_axis,'--');
ylabel('Y values');
end


