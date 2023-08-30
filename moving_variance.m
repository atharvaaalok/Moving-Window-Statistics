function var_timeseries = moving_variance(x, window_size, window_step)
    
    % Calculate required S's
    S1 = cumsum(x);
    S2 = cumsum(x .* x);
    
    % Set indices of window ends and beginnings (1 before)
    j = (window_size: window_step: length(x));
    i = j - window_size;
    % Make the first value dummy, this case will be handled separately
    i(1) = j(1);
    
    % Calculate required M's
    N = window_size;
    M1_ji = (S1(j) - S1(i)) / N;
    M2_ji = (S2(j) - S2(i)) - N * M1_ji .* M1_ji;

    % Calculate the statistic
    var_timeseries = M2_ji / (N - 1);

    % Handle the first value separately
    M1_ji = S1(N) / N;
    M2_ji = S2(N) - N * M1_ji .* M1_ji;
    var_timeseries(1) = M2_ji / (N - 1);

end