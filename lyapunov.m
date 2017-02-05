function ls = lyapunov(x0, y0, n_samples, param_range, gamma, transient_time, max_time)
    param_values = linspace(param_range(1), param_range(2), n_samples);
    ls=[]; % This stores the Lyapunov exponents
    for p=param_values
        x(1) = x0;
        y(1) = y0;
        lyp_exps = [];
        for(t = 1:max_time)
            x(t+1) = p - x(t)^2 + gamma*y(t);
            y(t+1) = x(t);
            % Wait until the transient period is over
            if(t > transient_time)
                % Evaluate the derivative at the current point
                lyp_exps = [lyp_exps, -2*x(t)];
            end
        end
    % Calculate Lyapunov approximation for the vector of derivatives
    ls = [ls, mean(log((abs(lyp_exps))))];
    end
end
