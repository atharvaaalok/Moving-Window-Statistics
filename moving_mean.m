function mean_timeseries = moving_mean(x, window_size, window_step)
    
    % Calculate required S's
    S1 = cumsum(x);
    
    % Set indices of window ends and beginnings (1 before)
    j = (window_size: window_step: length(x));
    i = j - window_size;
    % Make the first value dummy, this case will be handled separately
    i(1) = j(1);
    
    % Calculate required M's
    N = window_size;
    M1_ji = (S1(j) - S1(i)) / N;
    
    % Calculate the statistic
    mean_timeseries = M1_ji;

    % Handle the first value separately
    M1_ji = S1(N) / N;
    mean_timeseries(1) = M1_ji;

end