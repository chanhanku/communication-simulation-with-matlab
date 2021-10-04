F=zeros(1,1000000);
F_inv=zeros(1,1000000);
F_inv_y=zeros(1,1000000);
for ii=1:1000000
    u=rand(1);
    F_inv(ii)=sqrt(-log(1-u));
    F(ii)=2*u*exp(-u^2);
    F_inv_y(ii)=sqrt(-log(1-(u^2)));
end
figure(1)
 histogram(F_inv,[0:0.01:4]);
% figure(2)
% histogram(F,[0:0.01:4]);
figure(2)
histogram(F_inv_y,[0:0.01:4]);
MEAN=mean(F_inv)
VAR=var(F_inv)