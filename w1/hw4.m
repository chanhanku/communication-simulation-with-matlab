v=1:1:200;
current=v/1000;
subplot(2,1,1);
pw=v.*current;
plot(v,pw);
subplot(2,1,2);
pdbw=10*log10(pw);
plot(v,pdbw);