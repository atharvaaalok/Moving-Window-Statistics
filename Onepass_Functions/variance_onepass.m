function variance = variance_onepass(x)
    
    % Calculate required S's
    X2 = x .* x;
    S1 = sum(x);
    S2 = sum(X2);
    
    % Calculate required M's
    N = length(x);
    M1 = S1 / N;
    M2 = S2 - N * M1 * M1;
    
    % Calculate the statistic
    variance = M2 / (N - 1);

end