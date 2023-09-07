clear; clc; close all;


%% Generate a time series and set sizes for the window and step

N = 100000;
time = 1: N;
timeseries = randi(10, 1, N);

window_size = floor(N * 0.1);
overlap_ratio = 99 / 100;
window_step = floor(window_size * (1 - overlap_ratio));


%% Calculate the example moving window statistics using the provided functions

% Calculate the starting indices of windows
window_idx = 1: window_step: (length(time) - window_size + 1);
% Get the end indices of windows. These are the values at which the statistic values are represented
time_window_ends_idx = window_idx + window_size - 1;
time_stat = time(time_window_ends_idx);

% Calculate moving mean
mean_timeseries = moving_mean(timeseries, window_size, window_step);

% Calculate moving skewness
sk_timeseries = moving_skewness(timeseries, window_size, window_step);

% Calculate moving autocorrelation at specific lag
autocorr_lag = 1;
ac_timeseries = moving_autocorr(timeseries, window_size, window_step, autocorr_lag);


%% Plot the moving window statistics

figure();
tiledlayout(4, 1);
nexttile;
plot(time, timeseries);
ylabel('Time series');
xlim([time(1), time(end)]);
nexttile;
plot(time_stat, mean_timeseries);
xlim([time(1), time(end)]);
ylabel('Mean');
nexttile;
plot(time_stat, sk_timeseries);
xlim([time(1), time(end)]);
ylabel('Skewness')
xlabel('Time');
nexttile;
plot(time_stat, ac_timeseries);
xlim([time(1), time(end)]);
ylabel('Autocorrelation')
xlabel('Time');

