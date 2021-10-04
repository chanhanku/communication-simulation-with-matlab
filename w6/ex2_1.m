%BER of Binary antipodal Signalling in AWGN channel
% let Eav=Eavb=1
clear all;
SNR_dB=[-3 0 3 6 9];
M=[2 4 8 16];
N=10^6;
Count_BER=zeros(length(M),length(SNR_dB));
for ii=1:length(M)
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 a=M(ii)^2-1;
 b=3*log2(M(ii));
 E=a/b;
 N0=E/SNR;

 for t=1:N
 %-----------------------------------
 %generate received signal
 m=floor(rand(1)*M(ii)); % one-bit data
 Am=2*m-M(ii)+1;
 w=randn(1)*sqrt(N0/2);
 y=Am+w; % 接收訊號
 %-------------------------------------
 %Detection
 if abs(y-Am)>1
 Count_BER(ii,n)=Count_BER(ii,n)+1;
 end
 end
end
end
BER=Count_BER./N;
semilogy(SNR_dB,BER(1,:),'b-.');
hold on;
semilogy(SNR_dB,BER(2,:),'r-.');
hold on;
semilogy(SNR_dB,BER(3,:),'g-.');
hold on;
semilogy(SNR_dB,BER(4,:),'y-.');
hold on;
xlabel('SNR (dB)');
ylabel('Probability of bit errors');
legend('Binary Antipoddal');