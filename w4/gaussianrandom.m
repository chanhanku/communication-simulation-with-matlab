function y = gaussianrandom
ran =-1+ 2*rand(1,2);
r=ran(1,1)^2+ran(1,2)^2;
while r>=1
    ran =-1+ 2*rand(1,2);
    r=ran(1,1)^2+ran(1,2)^2;
end
y=sqrt((-2*log(r))/r) * ran(1,1);

