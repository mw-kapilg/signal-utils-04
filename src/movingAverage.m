function y = movingAverage(x, windowSize)
%MOVINGAVERAGE Trailing moving average of a vector.
%   Y = MOVINGAVERAGE(X, WINDOWSIZE) returns the mean of the last WINDOWSIZE
%   samples at each position of X. Early samples use the available history.

arguments
    x (:,1) double
    windowSize (1,1) double {mustBeInteger, mustBePositive}
end

% Vectorized with a cumulative sum instead of a loop.
c = cumsum([0; x]);
k = (1:numel(x))';
first = max(1, k - windowSize);
y = (c(k+1) - c(first)) ./ (k - first + 1);
end
