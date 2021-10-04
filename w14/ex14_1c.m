clear all;
SNR_dB=[0 3 6 9 12];
N=10^5;
Nt=4;
Nr=[4 6 8 10];
Count_BER_4bits=zeros(length(Nr),length(SNR_dB));
for m = 1 : length(Nr)
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=8/SNR;
 for t=1:N
 %------------------------------------------
 %generate channel
 H=(randn(Nr(m),Nt)+j*randn(Nr(m),Nt))*sqrt(1/2); % MIMO channel
 [U S V]=svd(H);
 %-----------------------------------
 %generate tx & rx signal -- 2 bits
 b_4bits=floor(rand(1,2)*2); % one-bit data
 bx_4bits=(-1).^b_4bits; % {0 1}-->{1 -1}
 x_4bits(1:4 ,:) = bx_4bits(1 , 1) + j * bx_4bits(1, 2);
 s_4bits=V*x_4bits;
 w_4bits=(randn(Nr(m),1)+j*randn(Nr(m),1))*sqrt(N0/2); % AWGN
 y_4bits=H*s_4bits+w_4bits;  
 %-------------------------------------
 %Detection -2bits
 z_4bits=U'*y_4bits;
 sigma=diag(S);
 r_4bits = z_4bits(1)* sigma(1)+ z_4bits(2)* sigma(2) +z_4bits(3)* sigma(3)+ z_4bits(4)* sigma(4)/(sigma(1)^2+sigma(2)^2+sigma(3)^2+sigma(4)^2);
 b_hat = zeros(1,2);
 b_hat(1,1) = (real(r_4bits) < 0) ;
 b_hat(1,2) = (imag(r_4bits) < 0);
 Count_BER_4bits(m,n)=Count_BER_4bits(m,n)+sum(abs(b_hat-b_4bits),'all');
 
end
end
end
BER_4bits=Count_BER_4bits./(2*N);
semilogy(SNR_dB,BER_4bits);
legend('Nr = 4','Nr = 6' , 'Nr = 8','Nr = 10');
xlabel('SNR (dB)');
ylabel('Probability of bit errors')