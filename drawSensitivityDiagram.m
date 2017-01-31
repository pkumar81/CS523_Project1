function drawSensitivityDiagram(x1_init, y1_init, x2_init, y2_init, timespace)

    % Sample run: drawSensitivityDiagram(0.555, 0.012, 0.553, 0.010, 50)

    % Define the constant values
    RHO = 1.29;
    GAMMA = 0.3;
    
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
    
    timer = [1];
    
    for i = 2 : timespace
        
        x1_vals = [x1_vals x_next(x1_vals(i-1), y1_vals(i-1))];
        y1_vals = [y1_vals y_next(x1_vals(i-1))];
        
        x2_vals = [x2_vals x_next(x2_vals(i-1), y2_vals(i-1))];
        y2_vals = [y2_vals y_next(x2_vals(i-1))];
        
        x_deviation = [x_deviation x1_vals(i) - x2_vals(i)];
        y_deviation = [y_deviation y1_vals(i) - y2_vals(i)];
        
        timer = [timer i];
        
    end
    
    %figure;
    %subplot(2,1,1);
    %yyaxis left;
    %plot(timer, x1_vals);
    %yyaxis right;
    %plot(timer, y1_vals);
    
    %subplot(2,1,2);
    %yyaxis left;
    %plot(timer, x2_vals);
    %yyaxis right;
    %plot(timer, y2_vals);
    
    figure
    subplot(1,1,1);
    title('Figrue 2a');
    hold on;
    yyaxis left;
    plot(timer, x1_vals);
    plot(timer, x2_vals);
    
    yyaxis right;
    plot(timer, y1_vals);
    plot(timer, y2_vals);
    hold off;
    
    figure
    subplot(1,1,1);
    title('Figrue 2b');
    hold on;
    yyaxis left;
    plot(timer, x_deviation);
    
    yyaxis right;
    plot(timer, y_deviation);
    hold off;
    
    end