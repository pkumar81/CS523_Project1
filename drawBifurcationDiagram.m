function drawBifurcationDiagram(x_init, y_init, timesteps)

    % This function generates the figures 3: Bifurcation of part 1
    % project 1. 
    % Sample run: drawBifurcationDiagram(0.555, 0.010, 1000)

    % Define the constant values
    RHO_BEGIN = 0.5;
    RHO_END = 1.4;
    RHO_CURR = 0;
    GAMMA = 0.3;
    
    % Define the annonymous functions
    x_next = @(x_curr, y_curr) RHO_CURR - x_curr^2 + GAMMA * y_curr;
    y_next = @(x_curr) x_curr;

    % Initialize the arrays of graph poiints
    x_vals = [];
    
    trans_time = timesteps / 2;
    rho_vals = [];
    
    % Generate the values for plotting
    for i = linspace(RHO_BEGIN, RHO_END, 500)
        RHO_CURR = i;
        curr_x_val = x_init;
        curr_y_val = y_init;
        for current_time = 1 : timesteps
        
            curr_x_val = x_next(curr_x_val, curr_y_val);
            %x1_vals = [x1_vals x_next(curr_x_val, curr_y_val)];
            %y1_vals = [y1_vals y_next(curr_x_val)];
            
            if(current_time > trans_time)
                rho_vals = [rho_vals i];
                x_vals = [x_vals curr_x_val];
            end
            curr_y_val = y_next(curr_x_val);
        end
    end
    
    % plot the graphs
    figure
    subplot(1,1,1);
    title('Figrue 3: Bifurcation');
    hold on;
    plot(rho_vals, x_vals, '.');
    hold off;
    
    end