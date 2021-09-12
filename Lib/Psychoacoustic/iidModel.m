function [bl, br, a] = iidModel(theta, r)
    if nargin < 2
        r = 0.08;
    end
    beta = 2 * speedSound / r;
    bl = [1 + cos(theta + pi/2), beta];
    br = [1 + cos(theta - pi/2), beta];
    a = [1, beta];
end
