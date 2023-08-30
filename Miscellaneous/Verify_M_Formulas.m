%% This script verifies the incremental update rules used to calculate:
% 1) Central moments
% 2) Cumulative sums of powers

% This was useful when the moving window functions were written to calculate the central moments through incremental update rules

clear; clc; close all;

% Generate data
N = 10;
x = randi(10, 1, N);


%% Calculate using the incremental update rules

M1 = 0;
M2 = 0;
M3 = 0;

% Use the incremental update rules to calculate the central moments
for n = 1: N
    delta = x(n) - M1;
    M1 = M1 + delta / n;
    M3 = M3 + delta * delta * delta * (n - 1) * (n - 2) / (n * n) - 3 * delta * M2 / n;
    M2 = M2 + delta * delta * (n - 1) / n;
end

S1 = M1 * N;
S2 = M2 + N * M1^2;
S3 = M3 + 3 * M1 * M2 + N * M1^3;

fprintf('Incremental Update Values\n');
fprintf([repmat('-', 1, 20), '\n']);
fprintf('M1 = %f\n', M1);
fprintf('M2 = %f\n', M2);
fprintf('M3 = %f\n', M3);
fprintf('S1 = %f\n', S1);
fprintf('S2 = %f\n', S2);
fprintf('S3 = %f\n\n', S3);


%% Calculate using definitions

M1_def = mean(x);
M2_def = sum( (x - M1_def).^2 );
M3_def = sum( (x - M1_def).^3 );
S1_def = sum(x);
S2_def = sum(x.^2);
S3_def = sum(x.^3);

fprintf('Definition Values\n');
fprintf([repmat('-', 1, 20), '\n']);
fprintf('M1_def = %f\n', M1_def);
fprintf('M2_def = %f\n', M2_def);
fprintf('M3_def = %f\n', M3_def);
fprintf('S1_def = %f\n', S1_def);
fprintf('S2_def = %f\n', S2_def);
fprintf('S3_def = %f\n\n', S3_def);


