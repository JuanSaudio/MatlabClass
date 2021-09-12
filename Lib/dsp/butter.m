function [b, a] = butter(order, wo)
    p = exp(1j * 2 * pi )
    semiOrder = floor((order + 1)/2)
    angDelta = pi / (2 * order)
    n = 0:semiOrder-1;

    p = 2 * pi * fc * exp(1j * (pi/2 + (2 * n + 1) * angDelta));
    z = [];
    k = 1 / prod(p);

    [b, a] = zp2tf(z, p, k)
end
