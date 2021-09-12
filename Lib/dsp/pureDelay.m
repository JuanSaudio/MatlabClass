%PUREDELAY apply delay to transfer function
%
% Usage:
% H = pureDelay(fax, H, del, type, fs, temp)
% where:
% fax: frequency axis definition
% H:     transfer function in its complex form
% delay: delay amount
% type:  delay type => select from milliseconds "ms"
%                                 samples "samp"
%                                 meters "m"
% fs:    sample rate only used if "samp" option is used
% temp:  temperature in centigrades only used if "m" option is used
%
% This application of a delay is a simple derivation from the  shift fourier 
% theorem[1]. However, it is very important to understand that this type of 
% implemenation is equivalent to a cyclic convolution in the time domain. 
% Accordingly, the time domain signal will be delayed but the last part of 
% the buffer will wrap around and end up at the begining of if! Be careful
% when expecting anything else than a spectral behavior.
%
% By: JuanS, Feb - 2020

function H = pureDelay(fax, H, delay, type, fs, temp)

    if nargin < 3
        type = "ms";
    end
    if nargin < 5
        temp = 20;
    end
    
    if type == "samp"
        d = delay / fs;
    elseif type == "ms"
        d = delay / 1000;
    elseif type == "m"
        d = delay / speedSound(temp);
    else
        error("The Type flag is neither of the options available");
    end
    
    H = H .* exp(-1j * 2 * pi * fax * d);
end