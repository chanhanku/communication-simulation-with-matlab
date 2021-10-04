%BER of BKSK Signalling in Rayleigh fading channel
clear all;
SNR_dB = 6 ;
Nt=10^5;
count=0;
% possible codewords
d = (0:15)';
b = de2bi(d,'left-msb');
G = [1 0 0 0 1 1 1;0 1 0 0 1 1 0;0 0 1 0 1 0 1;0 0 0 1 0 1 1];
u = mod( b * G,2);
up = (-1).^ mod( b * G,2);
dmin_idx=0;
f_b =  zeros(1,4);
dmin_b= zeros(1,4);
%--------------------
 SNR=10^(SNR_dB/10);
 N0=7/(4*SNR);
for t=1:Nt
 %-----------------------------------
 %generate received signal
 f = randi(16)-1; % one-bit data
 x=(-1).^u((f+1),:); % {0 1}-->{1 -1}
 w=(randn(1,7))*sqrt(N0/2);
 y=x+w;
 %-------------------------------------  
  for ii = 1:16
        dis(ii) = sum((up(ii,:)-y).^2);
  end
   dis = sqrt(dis);
    [dmin ,dmin_idx] =min(dis);
    dmin_b = de2bi(dmin_idx-1,4);
    f_b = de2bi(f,4);
    count = count+sum(abs(dmin_b - f_b));
end  
BER=count/(4*Nt);