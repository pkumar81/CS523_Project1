function drawSensitivityDiagram(x1_init, y1_init, x2_init, y2_init, timespace)

    % This function generates the figures 2a and 2b of dynamical map of
    % project 1. 
    % Sample run: drawSensitivityDiagram(0.555, 0.012, 0.553, 0.010, 50)

    % Define the constant values
    RHO = 1.29;
    GAMMA = 0.3;
    
    % Define the expected divergence
    DIVERGENCE_EPS = 0.1;
    
    % Define the annonymous functions
    x_next = @(x_curr, y_curr) RHO - x_curr^2 + GAMMA * y_curr;
    y_next = @(x_curr) x_curr;

    % Initialize the arrays of graph poiints
    x1_vals = [x1_init];
    y1_vals = [y1_init];
    
    x2_vals = [x2_init];
    y2_vals = [y2_init];
    
    x_deviation = [x1_init - x2_init];
    y_deviation = [y1_init - y2_init];
    
    divergence = [0];
    current_divergence = 0;
    divergence_time = 0;
    del_x = [0];
    
    timer = [1];
    
    % Generate the values for plotting
    for i = 2 : timespace
        x1_vals = [x1_vals x_next(x1_vals(i-1), y1_vals(i-1))];
        y1_vals = [y1_vals y_next(x1_vals(i-1))];
        
        x2_vals = [x2_vals x_next(x2_vals(i-1), y2_vals(i-1))];
        y2_vals = [y2_vals y_next(x2_vals(i-1))];
        
        x_deviation = [x_deviation abs(x1_vals(i) - x2_vals(i))];
        y_deviation = [y_deviation abs(y1_vals(i) - y2_vals(i))];
        
        timer = [timer i];
    end
    
    figure
    subplot(1,1,1);
    title('Figrue 2a, sensitivity to initial conditions:');
    xlabel('Time');
    ylabel('Divergence');
    hold on;
    yyaxis left;
    plot(timer, x_deviation);
    hold off;
    
    
    
    
    % Figure 2b starts here
        
    for i = 1:500
        x2_init = x1_init + i*0.0001;
        x1_vals = [x1_init];
        y1_vals = [y1_init];
    
        x2_vals = [x2_init];
        y2_vals = [y2_init];
    
        x_deviation = [x1_init - x2_init];
        y_deviation = [y1_init - y2_init];
        for j = 2:1000000
            x1_vals = [x1_vals x_next(x1_vals(j-1), y1_vals(j-1))];
            y1_vals = [y1_vals y_next(x1_vals(j-1))];
        
            x2_vals = [x2_vals x_next(x2_vals(j-1), y2_vals(j-1))];
            y2_vals = [y2_vals y_next(x2_vals(j-1))];
        
            current_divergence = abs(x1_vals(j) - x2_vals(j));
            
            if current_divergence > DIVERGENCE_EPS
                divergence_time = j;
                break;
            end
        end
        divergence = [divergence divergence_time];
        del_x = [del_x x2_init - x1_init];
    end
    
    figure
    subplot(1,1,1);
    title('Figrue 2b, sensitivity to initial conditions:', 'Fontsize', 24);
    xlabel('delX', 'Fontsize', 24);
    ylabel('Divergence', 'Fontsize', 24);
    hold on;
    %yyaxis left;
    plot(del_x, divergence);
    hold off;
    
    end