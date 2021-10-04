% OFDM signal with CP and QPSK modulation
% # of subcarriers=16, # of CP=4
% Length of channel = 3
clear all;
SNR_dB=[-3 0 3 6 9];
Nt=10^4;
Nc=64; % number of subcarriers
Lcp=5; % number of CP
Nb=2; % number of bit per sumbols
Lch=16; % length of channel
Count_BER=zeros(1,length(SNR_dB));
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=1/(SNR);
 for t=1:Nt
 %-----------------------------------
 %generate transmitted signal
 b=floor(rand(1,Nc*Nb)*2); % two-bit data
 X_f=zeros(Nc,1);
 for ns=1:Nc
 X_f(ns)=j*(-1)^b(2*ns-1)+(-1)^b(2*ns); %two-bit-->QPSK
 end
 x_t = ifft(X_f);
 % Insert CP
 x_t_CP=[x_t(Nc-Lcp+1:Nc); x_t];
 %-----------------------------------
 %generate channel coefficient
 h=zeros(Lch,1);
 for nch=1:Lch
 var_ch=(1-exp(-1))*exp(-nch+1)/(1-exp(-5));
 h(nch)=(randn(1)+j*randn(1))*sqrt(var_ch/2);
 end
 %generate received signal
 y_t_CP=conv(x_t_CP,h)+(randn(Nc+Lcp+Lch-1,1)+j*randn(Nc+Lcp+Lch-1,1))*sqrt(N0/2);
 %-------------------------------------
 %remove CP:
 y_t=y_t_CP(Lcp+1:Lcp+Nc);
 %Equalization and detection :
 Y_f=fft(y_t);
 H=fft(h, Nc); % Freq. domain channel
 Z_f=inv(diag(H))*Y_f;
 X_f_hat=sign(real(Z_f))+j.*sign(imag(Z_f));
 b_hat=zeros(1,Nc*Nb);
 for ns=1:Nc
 if imag(X_f_hat(ns))<0
 b_hat(2*ns-1)=1;
 end
 if real(X_f_hat(ns))<0
 b_hat(2*ns)=1;
 end
 end
 Count_BER(n)=Count_BER(n)+sum(abs(b_hat-b));
 end
end
BER=Count_BER./(Nb*Nc*Nt);
semilogy(SNR_dB,BER);
xlabel('SNR (dB)');
ylabel('Probability of errors');