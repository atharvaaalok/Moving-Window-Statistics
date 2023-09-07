function statistic_timeseries = MovingWindow_Statistic_Naive(x, window_size, window_step, statistic_name, comparison_type, autocorr_lag)

    % This is the naive implementation which calculates the statistic as follows:
    % 1) Loops over the data moving the window using the step size
    % 2) Calculate the statistic for each window using inbuilt functions
    % It is slower as it has a repetation of the same calculations. Eg: data common in consecutive windows will be squared again and again

    if strcmp(comparison_type, 'MovingWindow')
        % Get the indices where windows start and the corresponding times at which they end.
        % This is to specify the skewness of a window at the time value at the end of the window.
        window_idx = 1: window_step: (length(x) - window_size + 1);
        time_window_ends_idx = window_idx + window_size - 1;
        time_window_ends = x(time_window_ends_idx);
        
        statistic_timeseries = zeros(1, length(time_window_ends));
        timeseries_window_data = cell(1, length(time_window_ends));
    
        for i = 1: length(window_idx)
            timeseries_window_data{i} = x(window_idx(i): window_idx(i) + window_size - 1);
        end
    
        switch statistic_name
            case 'Mean'
                for i = 1: length(window_idx)
                    statistic_timeseries(i) = mean(timeseries_window_data{i});
                end
            case 'RMS'
                for i = 1: length(window_idx)
                    statistic_timeseries(i) = rms(timeseries_window_data{i});
                end
            case 'Variance'
                for i = 1: length(window_idx)
                    statistic_timeseries(i) = var(timeseries_window_data{i});
                end
            case 'Skewness'
                for i = 1: length(window_idx)
                    statistic_timeseries(i) = skewness(timeseries_window_data{i});
                end
            case 'Kurtosis'
                for i = 1: length(window_idx)
                    statistic_timeseries(i) = kurtosis(timeseries_window_data{i});
                end
            case 'Autocorrelation'
                for i = 1: length(window_idx)
                    AC_lag = autocorr_lag;
                    acf = autocorr(timeseries_window_data{i}, NumLags = AC_lag);
                    statistic_timeseries(i) = acf(AC_lag + 1);
                end
            otherwise
                warning('Invalid Statistic. Check name again.');
                exit();
        end
    else
        switch statistic_name
            % Below the return variable is called _timeseries even though it is actually just a single value
            case 'Mean'
                statistic_timeseries = mean(x);
            case 'RMS'
                statistic_timeseries = rms(x);
            case 'Variance'
                statistic_timeseries = var(x);
            case 'Skewness'
                statistic_timeseries = skewness(x);
            case 'Kurtosis'
                statistic_timeseries = kurtosis(x);
            case 'Autocorrelation'
                AC_lag = autocorr_lag;
                acf = autocorr(x, NumLags = AC_lag);
                statistic_timeseries = acf(AC_lag + 1);
            otherwise
                warning('Invalid Statistic. Check name again.');
                exit();
        end
    end


end