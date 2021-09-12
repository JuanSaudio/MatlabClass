function [zd, pd, kd] = bilinear(z, p, k, fs, fp)
    k = wo / tan(2 * pi * fp / (2.0 * fs));
    zd = (c + z) / (c - z);
    pd = (c + p) / (c - p);
end
