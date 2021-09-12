%% SCHROEDERINTEGRAL
% Simple implementation of schroeders reversed integral to
% estimate the decay rate of an impulse response
% JuanS - Oct 2019

function SI = schroederIntegral(h)
   
    SI = pow2db(flip(cumsum(flip(h.^2))));
    SI = SI - max(SI);

end
