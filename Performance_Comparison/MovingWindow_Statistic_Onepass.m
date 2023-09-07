function statistic_timeseries = MovingWindow_Statistic_Onepass(x, window_size, window_step, statistic_name, comparison_type, autocorr_lag)

    % This is the one pass implementation which calculates the statistic with a single pass over the data
    % This is faster as it gets rid of repetative calculations

    if strcmp(comparison_type, 'MovingWindow')
        switch statistic_name
            case 'Mean'
                statistic_timeseries = moving_mean(x, window_size, window_step);
            case 'RMS'
                statistic_timeseries = moving_rms(x, window_size, window_step);
            case 'Variance'
                statistic_timeseries = moving_variance(x, window_size, window_step);
            case 'Skewness'
                statistic_timeseries = moving_skewness(x, window_size, window_step);
            case 'Kurtosis'
                statistic_timeseries = moving_kurtosis(x, window_size, window_step);
            case 'Autocorrelation'
                statistic_timeseries = moving_autocorr(x, window_size, window_step, autocorr_lag);
            otherwise
                warning('Invalid Statistic. Check name again.');
                exit();
        end
    else
        switch statistic_name
            % Below the return variable is called _timeseries even though it is actually just a single value
            case 'Mean'
                statistic_timeseries = mean_onepass(x);
            case 'RMS'
                statistic_timeseries = rms_onepass(x);
            case 'Variance'
                statistic_timeseries = variance_onepass(x);
            case 'Skewness'
                statistic_timeseries = skewness_onepass(x);
            case 'Kurtosis'
                statistic_timeseries = kurtosis_onepass(x);
            case 'Autocorrelation'
                statistic_timeseries = autocorr_onepass(x, autocorr_lag);
            otherwise
                warning('Invalid Statistic. Check name again.');
                exit();
        end
    end


end