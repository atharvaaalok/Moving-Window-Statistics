function kurtosis = kurtosis_onepass(x)
    
    % Calculate required S's
    X2 = x .* x;
    X3 = X2 .* x;
    X4 = X3 .* x;
    S1 = sum(x);
    S2 = sum(X2);
    S3 = sum(X3);
    S4 = sum(X4);
    
    % Calculate required M's
    N = length(x);
    M1 = S1 / N;
    M1_sq = M1 * M1;
    M2 = S2 - N * M1_sq;
    % M3 = S3 - 3 * M1 * S2 + 2 * N * M1 * M1_sq;
    M4 = S4 - 4 * M1 * S3 + 6 * M1_sq * S2 - 3 * N * M1_sq * M1_sq;
    
    % Calculate the statistic
    kurtosis = N * M4 / (M2 * M2);

end