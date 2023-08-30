function sk_timeseries = moving_skewness_batch(x, window_size, window_step)
    
    % Calculate required S's
    x = [0, x];
    X2 = x .* x;
    X3 = X2 .* x;
    S1 = cumsum(x);
    S2 = cumsum(X2);
    S3 = cumsum(X3);
    
    % Set indices of window ends and beginnings (1 before)
    j = (window_size: window_step: length(x)) + 1;
    i = j - window_size;
    
    % Calculate required M's
    N = window_size;
    M1_ji = (S1(j) - S1(i)) / N;
    M1_ji_sq = M1_ji .* M1_ji;
    M2_ji = (S2(j) - S2(i)) - window_size * M1_ji_sq;
    M3_ji = (S3(j) - S3(i)) - 3 * M1_ji .* (S2(j) - S2(i)) + 2 * N * M1_ji .* M1_ji_sq;

    % Calculate the statistic
    sqrt_M2_ji = sqrt(M2_ji);
    sk_timeseries = sqrt(N) * M3_ji ./ (sqrt_M2_ji .* sqrt_M2_ji .* sqrt_M2_ji);

end