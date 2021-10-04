ran =-0.02+ 0.04*rand(1,100);
%df=zeros();
ii=1;
for rr=0:0.05:4.95
    f_sin(ii)=sin(rr);
    f_noise(ii)=f_sin(ii)+ran(1,ii);
    f_cos(ii)=cos(rr);
    
    ii=ii+1;
end
for aa=1:99
    df(aa)= (f_noise(aa+1)-f_noise(aa))/0.05;
    
end
plot(0:0.05:4.95,f_sin);
hold on
plot(0:0.05:4.95,f_noise);
plot(0:0.05:4.95,f_cos);
plot(0:0.05:4.95,df);
hold off