%BER of Binary antipodal Signalling in AWGN channel
% let Eav=Eavb=1
clear all;
SNR_dB=[-6 -3 0 3 6];
N=10^6;
Count_BER=zeros(1,length(SNR_dB));
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=1/SNR;
 BER_therom(n)=qfunc(sqrt(1/N0));

 for t=1:N
 %-----------------------------------
 %generate received signal
 x=1;
 w=randn(1)*sqrt(N0/2);
 w2=randn(1)*sqrt(N0/2);
 y=x+w; % 接收訊號
 y2=w2;
 %-------------------------------------
 %Detection
 if y2 > y
  Count_BER(n)=Count_BER(n)+1;
 end
 end
end
BER=Count_BER./N;
semilogy(SNR_dB,BER_therom,'r-');
hold on
semilogy(SNR_dB,BER,'b-.');
xlabel('SNR (dB)');
ylabel('Probability of bit errors');
legend('Binary Antipoddal');