function mean = mean_onepass(x)
    
    % Calculate required S's
    S1 = sum(x);
    
    % Calculate required M's
    N = length(x);
    M1 = S1 / N;
    
    % Calculate the statistic
    mean = M1;

end