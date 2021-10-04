%BER of BKSK Signalling in Rayleigh fading channel
clear all;
SNR_dB=[0 3 6 9 12];
Nt=10^5;
Count_BER=zeros(1,length(SNR_dB));
x_gray = zeros(1,2);
r_ray = zeros(1,2);
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=1/(SNR);
 for t=1:Nt
 %-----------------------------------
 %generate received signal
 b1=floor(rand(1)*2); 
 b2=floor(rand(1)*2); 
 x1 = (-1)^b1;
 x2 = (-1)^b2;
 x = x1 +j * x2;
 x_gray(1,1) = (x2 < 0);
 x_gray(1,2) = (x1 < 0);
 h=(randn(1)+j*randn(1))*sqrt(1/2); % Rayleigh fadingchannel
 w=(randn(1)+j*randn(1))*sqrt(N0/2); % AWGN r=[n1, n2, n3,n4]
 y=h*x+w;
 %-------------------------------------
 %Detection
 r=y/h;
 r_gray(1,1) = (imag(r) < 0);
 r_gray(1,2) = (real(r) < 0);
 if sum(abs(x_gray - r_gray)) >= 1
    Count_BER(n)=Count_BER(n) + 1;
 end
 end
end
BER=Count_BER./(2*Nt);
semilogy(SNR_dB,BER,'b-.');
legend('BER');
xlabel('SNR (dB)');
ylabel('Probability of bit errors');