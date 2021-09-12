%THRESHOLDINQUIET returns the threshold of hearing in dBSPL at the
%frequency or frequencies in freq
%
% Usage: amplitudeLevel = thresholdInQuiet(freq)
%
% Taken from:
% M. Bosi & R.E. Goldberg, "Introduction to Digital Audio Coding and Standards", Springer, 2003, ISBN: 978-1-4020-7357-1.
%
% By: JuanS - Apr 2019

function thIndB = thresholdInQuiet(freq)
    freq = freq / 1000;
    thIndB = 3.64 * freq.^(-0.8) - 6.5 * exp(-0.6 * (freq - 3.3).^2) + 0.001 * freq.^4;
end