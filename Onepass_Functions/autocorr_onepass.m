function autocorrelation = autocorr_onepass(x, lag)
    
    % Calculate required S's
    % Calculate the total S1 as the sum of parts which will be used later
    S1_a = sum(x(1: lag));
    S1_b = sum(x(lag + 1: end - lag));
    S1_c = sum(x(end - lag + 1: end));
    S1 = S1_a + S1_b + S1_c;
    S2 = sum(x .* x);

    % Calculate required P
    Pl = sum(x(1: end - lag) .* x(lag + 1: end));

    % Calculate required M's
    N = length(x);
    M1 = S1 / N;
    M2 = S2 - N * M1 * M1;

    % Calculate the statistic
    autocorrelation = (Pl - M1 * ( (S1_a + 2 * S1_b + S1_c) - M1 * (N - lag) )) / (M2);

end