% SPECTRALMASKING returns the threshold of hearing in dBSPL at the
% frequency or frequencies in freq for that specific amplitude and
% frequency.
% This threshold is produced by the spectral masking due to the excitation
% patterns in the basilar membrane inside the inner ear. This trace is
% statistic in nature.
%
% Usage: mask = spectralMasking(fc, freqs, amplitude, isTonal)
%
% where fc is the center frequency of the masker, freqs is the frequency or
% frequencies to be evaluated for the threshold of hearing and the
% amplitude is the amplitude in dBSPL of the masker. isTonal is a boolean
% option that provides a different masking drop depending on whether the
% masker is tonal or not in which case the spreading function changes
% significantly.
%
% Be aware that this function requires a freq2bark converter as the
% generalization of the spreading function is produced in the bark domain
%
% Taken from:
% M. Bosi & R.E. Goldberg, "Introduction to Digital Audio Coding and Standards", Springer, 2003, ISBN: 978-1-4020-7357-1.
%
% By: JuanS - Apr 2019

function mask = spectralMasking(fc, freqs, amplitude, isTonal)
    zc = freq2bark(fc);
    z = freq2bark(freqs);
    spl = amplitude;
    
    if isTonal
        drop = 16;
    else
        drop = 6;
    end
    
    dz = z - zc;
    hFlag = (dz > 0.5);
    ref = max(spl - 40.0, 0);
    mask = spl + (-27.0 + hFlag * (0.367 * ref)) .* (abs(dz) - 0.5);

    mask(abs(dz) <= 0.5) = spl;
    mask = mask - drop;

end