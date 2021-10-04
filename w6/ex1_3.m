%BER of Binary antipodal Signalling in AWGN channel
% let Eav=Eavb=1
clear all;
SNR_dB=[-3 0 3 6 9];
N=10^6;
Count_BER=zeros(1,length(SNR_dB));
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=1/SNR;
 BER_therom(n)=qfunc(sqrt(1/(2*N0)));

 for t=1:N
 %-----------------------------------
 %generate received signal
 b=rand(1);
 if b >0.5 || b==0.5
   x=1;
 else 
   x=0;
 end
 w=randn(1)*sqrt(N0/2);
 y=x+w; % 接收訊號
 %-------------------------------------
 %Detection
 if y>0.5 || y==0.5
   b_hat=1;
 else 
   b_hat=0;
 end
 Count_BER(n)=Count_BER(n)+abs(b_hat-x);
 end
end
BER=Count_BER./N;
semilogy(SNR_dB,BER_therom,'r-');
hold on
semilogy(SNR_dB,BER,'b-.');
hold off
xlabel('SNR (dB)');
ylabel('Probability of bit errors');
legend('Binary Antipoddal');