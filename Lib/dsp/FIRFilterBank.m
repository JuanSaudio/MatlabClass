function [y, cBands, delay, h] = FIRFilterBank(fTop, numBands, octFrac, order, x ,fs)

if isrow(x)
    [y, cBands] = FIRFilterBank(fTop, numBands, octFrac, order, fs, x');
    y = y';
    return
end

cBands = fTop * 2.^(-(0:numBands-1) * octFrac);
f = fTop * 2.^(-(0.5:numBands-1) * octFrac);

fs2 = fs/2;
hCell = cell(numBands, 1);

winHandl = @blackman;
vararg = {};

for i = 1:numBands
    if i == numBands
        fc = f(i-1);
        Oi = order * fs2 ./ fc;
        Oi = floor(Oi);
        if mod(Oi, 2) == 1; Oi = Oi + 1; end
        win = window(winHandl, Oi + 1, vararg{:});
        hi = fir1(Oi, fc/fs2, 'low', win);
    elseif i == 1
        fc = f(i);
        Oi = order * fs2 ./ fc;
        Oi = floor(Oi);
        if mod(Oi, 2) == 1; Oi = Oi + 1; end
        win = window(winHandl, Oi + 1, vararg{:});
        hi = fir1(Oi, fc/fs2, 'high', win);
    else
        fc1 = f(i-1);
        fc2 = f(i);
        Oi1 = order * fs2./fc1;
        Oi1 = floor(Oi1);
        Oi2 = order * fs2./fc2;
        Oi2 = floor(Oi2);
        if mod(Oi1, 2) == 1; Oi1 = Oi1 + 1; end
        if mod(Oi2, 2) == 1; Oi2 = Oi2 + 1; end
        
        win1 = window(winHandl, Oi1 + 1, vararg{:});
        win2 = window(winHandl, Oi2 + 1, vararg{:});
        hi1 = fir1(Oi1, fc1/fs2, 'low', win1);
        hi2 = fir1(Oi2, fc2/fs2, 'high', win2);
        hi = conv(hi1, hi2);
    end
    hCell{i} = hi;
end

maxLength = max(cellfun(@length, hCell));
h = zeros(numBands, maxLength);

for i = 1:numBands
    h(i,1:length(hCell{i})) = hCell{i};
end

[pk, pkIdx] = max(abs(h), [], 2);

for i = 1:numBands
    h(i,:) = circshift(h(i,:), max(pkIdx) - pkIdx(i));
end

dirac = zeros(1, maxLength);
dirac(max(pkIdx)) = 1;
delay = max(pkIdx);
% 
% err = sum(h) - dirac;
% pkW = (1 - pk/sum(pk));
% pkW = pkW / sum(pkW);
% h = h - pkW .* err;
% 
% if ~islinphase(err)
%     error("Something went wrong: Err is not linphase")
% end

for i = 1:numBands
    if ~islinphase(h(i,:))
        error("Something went wrong");
    end
end
h = h.';

y = fftfilt(h, x');

end