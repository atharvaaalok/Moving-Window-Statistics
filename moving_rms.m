function rms_timeseries = moving_rms(x, window_size, window_step)
    
    % Calculate required S's
    S2 = cumsum(x .* x);
    
    % Set indices of window ends and beginnings (1 before)
    j = (window_size: window_step: length(x));
    i = j - window_size;
    % Make the first value dummy, this case will be handled separately
    i(1) = j(1);
    
    N = window_size;
    
    % Calculate the statistic
    rms_timeseries = sqrt( (S2(j) - S2(i)) / N );

    % Handle the first value separately
    rms_timeseries(1) = sqrt( S2(N) / N );

end