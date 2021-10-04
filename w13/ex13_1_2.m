%BER of BPSK Signalling in SIMO Rayleigh fading channel-EGC
% # of rx antennas =2
clear all;
SNR_dB=[-3 0 3 6 9];
N=10^5;
Nr=[2 4 6 8];
Count_BER=zeros(length(Nr),length(SNR_dB));
for m = 1 : length(Nr)
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=1/SNR;
 for t=1:N
 %-----------------------------------
 %generate received signal
 b=floor(rand(1,2)*2); % 2-bit data
 bc=(-1).^b; % {0 1}-->{1 -1}
 x = bc(1) + j*bc(2);
 h=(randn(Nr(m),1)+j*randn(Nr(m),1))*sqrt(1/2); 
 w=(randn(Nr(m),1)+j*randn(Nr(m),1))*sqrt(N0/2);
 y=x.*h+w; 
 %-------------------------------------
 %Detection
 alpha_egc=exp(-j.*angle(h));
 z_egc=sum(alpha_egc.*y);
 h_egc=sum(alpha_egc.*h);
 r=z_egc/h_egc;
 b_hat = zeros(1,2);
 b_hat(1,1) = (real(r) < 0) ;
 b_hat(1,2) = (imag(r) < 0);
 Count_BER(m,n)=Count_BER(m,n)+sum(abs(b_hat-b));
 end
end
end
BER=Count_BER./(2*N);
semilogy(SNR_dB,BER);
legend('EGC-L Nr=2','EGC-L Nr=4','EGC-L Nr=6','EGC-L Nr=8');
xlabel('SNR (dB)');
ylabel('Probability of bit errors');
