function h = linPhaseFilter(b, a, N)
k = (-N/2:N/2-1)';
h = impz(b, a);
H = fft(h, N);
% H = fftshift(H);
H = abs(H);
% H = H .* exp(1j * 2 * pi * k / N);
% H = ifftshift(H);
h = ifft(H);
% h(end) = [];
h = fftshift(h);
h = real(h);

h = (h + flip(h)) / 2;
if ~islinphase(h)
    disp("Filter is not LinPhase");
end
end
