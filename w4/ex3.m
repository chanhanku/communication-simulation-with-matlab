df=zeros(100);
kk=1;
for ii=0:0.05:4.95
    df(kk)= (sin(ii+0.05)-sin(ii))/0.05;
    kk=kk+1;
end
plot(0:0.05:4.95,df);
hold on
rr=0:0.05:4.95;
plot(rr,sin(rr));
plot(rr,cos(rr));

