function var_timeseries = moving_variance_batch(x, window_size, window_step)
    
    % Calculate required S's
    x = [0, x];
    X2 = x .* x;
    S1 = cumsum(x);
    S2 = cumsum(X2);
    
    % Set indices of window ends and beginnings (1 before)
    j = (window_size: window_step: length(x)) + 1;
    i = j - window_size;
    
    % Calculate required M's
    N = window_size;
    M1_ji = (S1(j) - S1(i)) / N;

    % Calculate necessary central moments
    M2_ji = (S2(j) - S2(i)) - window_size * M1_ji .* M1_ji;

    % Calculate the statistic
    var_timeseries = M2_ji / (N - 1);

end