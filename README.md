# Moving-Window-Statistics

This is a toolbox for calculating moving window statistics such as mean, variance, skewness, etc. **fast**!

Get started with the [Example.m](Example.m) file.

Released on MATLAB FileExchange [![View Moving Window Statistics on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://in.mathworks.com/matlabcentral/fileexchange/134476-moving-window-statistics)

## Introduction
A simple and naive approach towards calculating moving window statistics could be to move the window over the data and for each window calculate the moving window statistic using in-built functions (such as `var`, `skewness` etc. in MATLAB). But this approach is very slow as it involves a lot of redundant calculations. For example, consider the case of finding the moving variance. Using this naive approach, for each window one would have to square all the data points towards calculation of the variance. Now since the windows will have a good amount of overlap the same data point which is common amongst several windows will be squared repeatedly, leading to redundant calculations which slow down the process.  

To calculate the different moving window statistics fast we use a **one-pass** approach where we go through each data point only once, getting rid of all redundant operations.  

The formulas used for calculating the statistical values and the proofs for the formulas are explained in the pdf document [Moving_Window_Statistics_Explanations.pdf](Miscellaneous/Moving_Window_Statistics_Explanations.pdf) provided.

## Performance Comparison
The speed gains, as measured by the ratio of time taken by the naive approach and the moving statistic functions are quite astonishing![^1].
|Statistic|Speed Gain|
|---------|----------|
|Mean|108x|
|RMS|151x|
|Variance|71x|
|Skewness|400x|
|Kurtosis|310x|
|Autocorrelation|765x|

These tests can be performed by running the [Performance_Comparison.m](Performance_Comparison/Performance_Comparison.m) file provided.

[^1]: The speed gains are approximate. Also, they depend on the length of the time series. Current results are for a length of 100,000.

## References
[Wikipedia: Algorithms for calculating variance](https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance)  
[MATLAB Answers: Optimizing for speed. Moving skewness finder. Cumulative sum proving to be bottleneck.](https://in.mathworks.com/matlabcentral/answers/2013192-optimizing-for-speed-moving-skewness-finder-cumulative-sum-proving-to-be-bottleneck#answer_1294112)

##
> [!NOTE]
> Suggestions for improving the method and code are highly encouraged!