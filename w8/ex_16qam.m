clear all;
SNR_dB=[-3 0 3 6 9 ];
N=10^6;
Count_SER=zeros(1,length(SNR_dB));
Count_BER=zeros(1,length(SNR_dB));
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=5/(2*SNR);
 for t=1:N
 %-----------------------------------
 %generate received signal
 di = floor(rand(1)*4); 
 Ami = 2*di - 3;
 dq = floor(rand(1)*4);
 Amq =  2*dq - 3;
 Am = Ami + j * Amq;
 Am_gray = graycode4_4(Am);
 w=(randn(1)+j*randn(1))*sqrt(N0/2);
 r=Am+w; 
 %-------------------------------------
 %Detection
if ( abs(real(w)) > 1) || ( abs(imag(w)) > 1)
    Count_SER(n)=Count_SER(n)+1;
end
 r_gray = graycode4_4(r);
 Count_BER(n)=Count_BER(n)+sum(abs(r_gray - Am_gray));
end
end
SER=Count_SER./N;
BER=(Count_BER)./(4*N);
semilogy(SNR_dB,SER,'b-.o',SNR_dB,BER,'r-^');
xlabel('SNR (dB)');
ylabel('Probability of errors');
legend('SER','BER');