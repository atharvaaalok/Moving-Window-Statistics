function sk_timeseries = moving_skewness(x, window_size, window_step)

    % Calculate required S's
    X2 = x .* x;
    S1 = cumsum(x);
    S2 = cumsum(X2);
    S3 = cumsum(X2 .* x);

    % Set indices of window ends and beginnings (1 before)
    j = (window_size: window_step: length(x));
    i = j - window_size;
    % Make the first value dummy, this case will be handled separately
    i(1) = j(1);
    
    % Calculate required M's
    N = window_size;
    M1_ji = (S1(j) - S1(i)) / N;
    M1_ji_sq = M1_ji .* M1_ji;
    S2_ji = S2(j) - S2(i);
    M2_ji = S2_ji - N * M1_ji_sq;
    M3_ji = (S3(j) - S3(i)) + M1_ji .* (-3 * S2_ji + 2 * N * M1_ji_sq);
    
    % Calculate the statistic
    sk_timeseries = sqrt(N) * M3_ji ./ (M2_ji .* sqrt(M2_ji));

    % Handle the first value separately
    M1_ji = S1(N) / N;
    M1_ji_sq = M1_ji * M1_ji;
    S2_ji = S2(N);
    M2_ji = S2_ji - N * M1_ji_sq;
    M3_ji = S3(N) + M1_ji * (-3 * S2_ji + 2 * N * M1_ji_sq);
    sk_timeseries(1) = sqrt(N) * M3_ji / (M2_ji * sqrt(M2_ji));

end