function skewness = skewness_onepass(x)
    
    % Calculate required S's
    X2 = x .* x;
    X3 = X2 .* x;
    S1 = sum(x);
    S2 = sum(X2);
    S3 = sum(X3);
    
    % Calculate required M's
    N = length(x);
    M1 = S1 / N;
    M1_sq = M1 * M1;
    M2 = S2 - N * M1_sq;
    M3 = S3 - 3 * M1 * S2 + 2 * N * M1 * M1_sq;
    
    % Calculate the statistic
    sqrt_M2 = sqrt(M2);
    skewness = sqrt(N) * M3 / (sqrt_M2 * sqrt_M2 * sqrt_M2);

end