function ac_timeseries = moving_autocorr(x, window_size, window_step, lag)

    % Calculate required S's
    % Calculate the total S1 as the sum of parts which will be used later
    S1 = cumsum(x);
    S2 = cumsum(x .* x);

    % Calculate required P
    Pl = cumsum(x(1: end - lag) .* x(lag + 1: end));
    
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
    temp = S1(j) + S1(j - lag) - S1(i + lag) - S1(i);
    ac_timeseries = ( (Pl(j - lag) - Pl(i)) - M1_ji .* (temp - M1_ji * (N - lag)) ) ./ M2_ji;

    % Handle the first value separately
    M1_ji = S1(N) / N;
    M2_ji = S2(N) - N * M1_ji .* M1_ji;
    temp = S1(N) + S1(N - lag) - S1(lag);
    ac_timeseries(1) = ( Pl(N - lag) - M1_ji .* (temp - M1_ji * (N - lag)) ) ./ M2_ji;

end