function snr = coherence2snr(gammaSqr)
    snr = gammaSqr ./ (1 - gammaSqr);
end
