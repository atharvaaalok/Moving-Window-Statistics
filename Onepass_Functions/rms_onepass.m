function rms = rms_onepass(x)
    
    % Calculate required S's
    S2 = sum(x .* x);

    N = length(x);
    
    % Calculate the statistic
    rms = sqrt(S2 / N);
    
end