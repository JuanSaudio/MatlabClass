function hmin = minPhaseFilter( h )
% Very obscure stuff do not use unless you know what this is exactly
Hmag = abs(fft(h));
HmagdB = log10(Hmag);
HangdB = imag(hilbert(HmagdB));

Hmin = 10.^(HmagdB - 1j * HangdB);
hmin = real(ifft(Hmin));
end