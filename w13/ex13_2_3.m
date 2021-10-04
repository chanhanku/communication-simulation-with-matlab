%BER of QPSK Signalling in MSIO Rayleigh fading channel
%EGT
% # of tx antennas =2
% let Eav=Eavb=1
clear all;
SNR_dB=[-3 0 3 6 9];
N=10^5;
Nt=[2 4 6 8];
Count_BER=zeros(length(Nt),length(SNR_dB));
for m = 1 : length(Nt)
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=1/SNR;
 for t=1:N
 %-----------------------------------
 %generate received signal
 b=floor(rand(1,2)*2); % 2-bit data
 bc=(-1).^b; % {0 1}-->{1 -1}
 x = bc(1) + j*bc(2);
 h=(randn(1,Nt(m))+j*randn(1,Nt(m)))*sqrt(1/2); 
 beta_egc = sqrt(1/Nt(m))*exp(-j * angle(h));
 s=x*beta_egc;
 w=(randn(1)+j*randn(1))*sqrt(N0/2); 
 y=sum(h.*s)+w;
 %-------------------------------------
 %Detection
 h_egc=sum(h.*beta_egc);
 r=y/h_egc;
 b_hat = zeros(1,2);
 b_hat(1,1) = (real(r) < 0) ;
 b_hat(1,2) = (imag(r) < 0);
 Count_BER(m,n)=Count_BER(m,n)+sum(abs(b_hat-b));
 end
end
end
BER=Count_BER./(2*N);
semilogy(SNR_dB,BER);
legend('EGT-L Nr=2','EGT-L Nr=4','EGT-L Nr=6','EGT-L Nr=8');
xlabel('SNR (dB)');
ylabel('Probability of bit errors');