% SPECTRALSMOOTHING is an exponential smoother for spectral purposes. It
% supports multiple types of spectral smoothing including constant
% bandwidth smoothing ('log'), equivalent rectangular bandwidth ('erb'),
% bark scale ('bark'), mel scale ('mel') and linear scale.
%
% Usage: Hs = spectralSmoothing(freq, H, beta, type)
%   CAREFUL! if smoothing a transfer function use either the complex values
%   or the magnitude in dB to achieve the desired result. Using the linear
%   amplitudes will likely produce an undesirable result.
%
% where :
%   freq are the frequencies to be used. 
%   H is an array of spectral data or a matrix of spectral data points. 
%   beta is a fraction of the relevant unit in the corresponding scale.
%       beta is a fraction of an octave if type is 'log'
%       beta is a fraction of an erb if type is 'erb'
%       beta is a fraction of a critical bandwidth if type is 'bark'
%   type is one of the following:
%       'log', 'erb', 'bark', 'mel', 'lin'
% 
% be aware that this function requires freq to be an array, and H to have
% a common dimension with freq.
%
%
% The spectral smoother is a filter applied in the cepstral domain; however
% is implemented as a convolution with the spectral bins. The exponential
% smoother is a normal-like function whose width defines the degree of
% smoothing. Let the smoother be
%   W(k) = exp( -c (k - k0)^2 ) and let the desired level (usually half) at
%   bin ki to be Lb so that ki = k0 + beta/2
%   W(k0 + beta/2) = exp(-c (k0 + beta/2 - k0)^2 ) = Lb (usually 0.5)
%   c = - 4 Ln (Lb) / (beta^2)
% At this point, notice that c must be positive otherwise the function is
% no longer normal-like and accordingly, Lb needs to be smaller than 1. For
% computational simplicity and given that we almost always want Lb to be
% 0.5 we can write this as
%   c = Ln(16)/(beta^2)
% with then implies
%   W(k) = exp( - Ln(16)/(beta^2) (k - k0)^2 )
%
% Finally, notice that (k - k0).^2 is symmetric around k0. So simple
% transformation need to be done to take advantage of this symmetry
% dependin on how we want the freq axis to behave. For example in a
% constant bandwidth smoother we would like k = log2(freq) so that
% equivalent fractions of an octave get an equivalent weighting on the
% smoothing of each point.
%
% The algorithm, nevertheless, is written to optimize performance.
% Accordingly, all the convolution kernels are computed at the same time in
% the matrix w where an all-to-all comparison is computed as bin - bin'.
% And the convolution is implemented as a matrix multiplication. Notice
% that this is the reason why it is possible to compute multiple smoothed
% spectral traces at the same time.
%
% Finally, notice that each convolution is normalized to achieve a unitary
% conversion. This could be further simplified given that the integral of
% the window is well known ( sqrt( pi / c ) / mean(diff(bins)) ) but this
% would lead to a constant value that would attenuate too much the edges
% where the window is significantly shorter than in the center of the
% frequency axis.
%
% Regarding the perceptual smoothers check their own documentation to
% better understand their purpose.
%
% By JuanS - Apr 2019
%
% See also freq2erb, freq2bark, freq2mel, erb2freq, bark2freq, mel2freq

function Hs = spectralSmoothing(freq, H, beta, type)

    assert(any(size(freq) == size(H)), 'Array Sizes do not match')
    assert(isvector(freq), 'Freq must be an array')

    if nargin < 4, type = "log"; end
    if nargin < 3, beta = 1/3; end
    
    if ~isreal(H)
        % Simple recursion to handle complex values
        Hmag = spectralSmoothing(freq, mag2db(abs(H)), beta, type);
        Hang = spectralSmoothing(freq, unwrap(angle(H), [], 1), beta, type);
        Hs = db2mag(Hmag) .* exp(1j * Hang);
        return
    end
    
    if isrow(freq)
        % Simple recursion to handle rows vs columns
        Hs = spectralSmoothing(freq', H.', beta, type).';
        return
    end
    
    if type == "log"
        if freq(1) == 0
            freq(1) = eps;
        end
        bins = log2(freq);
    elseif type == "erb"
        bins = freq2erb(freq);
    elseif type == "bark"
        bins = freq2bark(freq);
    elseif type == "mel"
        bins = freq2mel(freq);
    elseif type == "lin"
        bins = freq;
    else 
        error('Type option not recognized');
    end
    
    c = log(16) / ((beta).^2);
    w = exp(- c * (bins - bins').^2);
%     w = w / (sqrt(pi/c));                       % This could be used if
                                                  % performance is more 
                                                  % important than edge 
                                                  % precission.
%     w2 = conv(2.^bins, [0.5, 0, -0.5], 'same'); % This could be use if the
%     w2(1) = diff(bins(1:2));                    % Bin spacing is affecting 
%     w2(end) = diff(bins(end-1:end));            % the precission of the 
%     w = w .* w2.^(1/max(freq));                 % smoothing
%     w = w ./ sqrt(sum(w, 'all'));

    
    
    w = w ./ sum(w, 2);                                          
    Hs = (w * H);
    
% QUICK TWO-LINERS IF NEEDED
%     c = log(16) / ((beta).^2);
%     Hs = exp( -c * (bins - bins').^2 ) * H ./ sqrt(pi/c)/mean(diff(bins))    
end