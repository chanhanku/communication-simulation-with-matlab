function ran = random0(m)
global ISEED 
msg = nargchk(1,1,nargin);
error(msg);

for ii = 1:m
ISEED = mod(8121*ISEED + 28411,  134456 );
ran(ii) = mod(ISEED , 6) + 1;
end
end