function c = soundSpeed(temp)
	if nargin < 1
	    temp = 20;
	end
	c = 331.4 + 0.6 * temp;
end
