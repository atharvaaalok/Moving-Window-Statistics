function mean_timeseries = moving_mean_batch(x, window_size, window_step)
    
    % Calculate required S's
    x = [0, x];
    S1 = cumsum(x);
    
    % Set indices of window ends and beginnings (1 before)
    j = (window_size: window_step: length(x)) + 1;
    i = j - window_size;
    
    % Calculate required M's
    N = window_size;
    M1_ji = (S1(j) - S1(i)) / N;
    
    % Calculate the statistic
    mean_timeseries = M1_ji;

end