# Moving-Window-Statistics

This is a toolbox for calculating moving window statistics such as mean, variance, skewness, etc. **fast**!

Get started with the [Example.m](Example.m) file.

## Introduction
A simple and naive approach towards calculating moving window statistics could be to move the window over the data and for each window calculate the moving window statistic using in-built functions (such as `var`, `skewness` etc. in MATLAB). But this approach is very slow as it involves a lot of redundant calculations. For example, consider the case of finding the moving variance. Using this naive approach, for each window one would have to square all the data points towards calculation of the variance. Now since the windows will have a good amount of overlap the same data point which is common amongst several windows will be squared repeatedly, leading to redundant calculations which slow down the process.  

To calculate the different moving window statistics fast we use a **one-pass** approach where we go through each data point only once, getting rid of all redundant operations.  

The formulas used for calculating the statistical values and the proofs for the formulas are explained in the pdf document [Moving-Window-Statistics](Miscellaneous/Moving_Window_Statistics_Explanations.pdf) provided.

## References
[Wikipedia: Algorithms for calculating variance](https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance)

##
> [!NOTE]
> Suggestions for improving the method and code are highly encouraged!