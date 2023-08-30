function rms_timeseries = moving_rms_batch(x, window_size, window_step)
    
    % Calculate required S's
    x = [0, x];
    S2 = cumsum(x .* x);
    
    % Set indices of window ends and beginnings (1 before)
    j = (window_size: window_step: length(x)) + 1;
    i = j - window_size;
    
    N = window_size;
    
    % Calculate the statistic
    rms_timeseries = sqrt( (S2(j) - S2(i)) / N );

end