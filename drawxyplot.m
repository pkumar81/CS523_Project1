function [x_vals, y_vals] = drawxyplot(x,y,t,phi,gamma)
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
end


