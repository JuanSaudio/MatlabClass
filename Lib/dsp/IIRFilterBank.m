function [y, cBands] = IIRFilterBank(fTop, numBands, octFrac, order, x ,fs)

if mod(order, 2) == 0
    error('Filter Bank can only be of odd order');
end

if isrow(x)
    [y, cBands] = IIRFilterBank(fTop, numBands, octFrac, order, fs, x');
    y = y';
    return
end


cBands = fTop * 2.^(-(0:numBands-1) * octFrac);
f = fTop * 2.^(-(0.5:numBands-1) * octFrac);

y = zeros(length(x), numBands);

for i = 1:numBands
    sos = zeros(0, 6);
%     g = zeros(0, 0);
    for j = 1:length(f)
        if i > j
            [zi, pi, ki] = butter(order, f(j) / (fs / 2), 'low');
        elseif i == j
            [zi, pi, ki] = butter(order, f(j) / (fs / 2), 'high');
        elseif i < j
            [zi, pi, ki] = butterAllPass(order, f(j), fs);
        end
        curSos = zp2sos(zi, pi, ki);
        if ~isstable(curSos)
            if i > j
                fprintf("Unstable LP")
            elseif i == j
                fprintf("Unstable HP")
            elseif i < j
                fprintf("Unstable AP")
            end
        end
        sos = [sos; curSos];                %#ok<AGROW>
    end
    y(:,i) = sosfilt(sos, x);
end

% PRINT THIS TO UNDERSTAND STRUCTURE
for i = 1:numBands
    for j = 1:length(f)
        if i > j
            fprintf("| lp %u |", j)
        elseif i == j
            fprintf("| hp %u |", j)
        elseif i < j
            fprintf("| ap %u |", j)
        end
    end
    fprintf("\n");
end
end

function [z, p, k] = butterAllPass(N, fc, fs)
    [~, pC, ~] = butter(N, fc / (fs / 2));
    [~, idx] = sort(angle(pC));
    pC = pC(idx);
    
    if mod(N, 4) == 1
        p = pC(2:2:end);
        z = 1./p;
        k = abs(prod(pC(1:2:end)));
    else
        p = pC(1:2:end);
        z = 1./p;
        k = abs(prod(pC(2:2:end)));
    end 
end

