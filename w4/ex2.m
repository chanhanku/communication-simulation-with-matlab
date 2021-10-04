function ran = ex2(m,n)
msg = nargchk(1,2,nargin);
error(msg);
if nargin < 2
n = m ;
end



ran = zeros(m,n);

for ii = 1:m
 for jj = 1:n
 ran(ii,jj) = gaussianrandom;
end
end 
std(ran)
hist(ran,100)
title('\bfHistogram of the Output of random0');
xlabel('Bin');
ylabel('Count');