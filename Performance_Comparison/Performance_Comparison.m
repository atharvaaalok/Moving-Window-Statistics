clear; clc; close all;

% Add relevant function folders to path
addpath('../', '../Onepass_Functions');

% Choose one type of statistic evaluation: 'Normal' or 'MovingWindow'
% 1) 'Normal' - calls functions that calculate one value for entire time series
% 2) 'MovingWindow' - moves a window with some step size across the data and generates a time series for the statistic
comparison_type = 'MovingWindow';

% Choose one statistic to compare from the below list
% ['Mean', 'RMS', 'Variance', 'Skewness', 'Kurtosis', 'Autocorrelation'];
statistic_name = 'Autocorrelation';

% Choose the lag for autocorrelation. If the statistic chosen is not autocorrelation, then this will be unused
autocorr_lag = 10;


%% What we can vary

N = 100000;

window_size = floor(N * 0.05);
overlap_ratio = 99 / 100;
window_step = floor(window_size * (1 - overlap_ratio));

total_avg_count = 1;


%% Compare the values and the time taken for generating statistical quantities

time_naive = 0;
time_onepass = 0;

for i = 1: total_avg_count
    % Generate random timeseries
    timeseries = randi(10, 1, N);

    % Calculate statistic using naive method and using in-built functions
    tic_naive = tic;
    stat_naive = MovingWindow_Statistic_Naive(timeseries, window_size, window_step, statistic_name, comparison_type, autocorr_lag);
    time_naive = time_naive + toc(tic_naive);
    
    % Calculate statistic using one-pass functions
    tic_onepass = tic;
    stat_onepass = MovingWindow_Statistic_Onepass(timeseries, window_size, window_step, statistic_name, comparison_type, autocorr_lag);
    time_onepass = time_onepass + toc(tic_onepass);

end

% Average out the times
time_naive = time_naive / total_avg_count;
time_onepass = time_onepass / total_avg_count;

fprintf('Time taken naive = %f\n', time_naive);
fprintf('Time taken onepass = %f\n\n', time_onepass);
fprintf('Ratio of times taken (Naive / Onepass) = %f\n\n', time_naive / time_onepass);

% Calculate percentage difference
diff_timeseries = stat_naive - stat_onepass;
difference_percentage = 100 * sum(abs(diff_timeseries)) / sum(abs(stat_naive));

fprintf('Difference Percentage = %f\n', difference_percentage);


%% Plot both the time series to visually compare

% Plot only if the comparison type chosen is 'MovingWindow' as 'Normal' calculates a single value
if strcmp(comparison_type, 'MovingWindow')
    % Plot both time series
    figure();
    tiledlayout('flow');
    nexttile;
    plot(stat_naive);
    nexttile;
    plot(stat_onepass);
end


