function [dL, dR] = itdModel(theta, r)
    if nargin < 2
        r = 0.08;
    end
    
    delta = r / speedSound * (theta + sin(theta));
    
    if theta > 0
        dR = delta;
        dL = 0;
    else
        dL = 0;
        dR = delta;
    end
end