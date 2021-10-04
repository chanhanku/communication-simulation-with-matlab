%BER for MIMO systems (OSTBC)
% 2x2 & 2x4
clear all;
SNR_dB=[0 3 6 9 12];
N=10^5;
Nt=2;
Nr= [2 4 6 8];
T = 2;
Count_BER=zeros(length(Nr),length(SNR_dB));
for m = 1:length(Nr)
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=4/SNR;
 for t=1:N
 %------------------------------------------
 %generate channel
 H=(randn(Nr(m),Nt)+j*randn(Nr(m),Nt))*sqrt(1/2); % MIMO channel
 %-----------------------------------
 %generate tx & rx signal -- 2 bits
 b=floor(rand(2,2)*2); % one-bit data
 xb=(-1).^b; % {0 1}-->{1 -1}
 x = xb(: , 1) + j * xb(: , 2);
 S=[x(1) x(2); -x(2)' x(1)'];
 w=(randn(T,Nr(m))+j*randn(T,Nr(m)))*sqrt(N0/2); % AWGN 
 y=S*H.'+w; % NxNr 接收訊號
 %-------------------------------------
 A1=[1 0; 0 0];
 A2=[0 1; 0 0];
 B1=[0 0; 0 1];
 B2=[0 0; -1 0];
 z=zeros(2,1);
 for t=1:Nr(m)
 z(1)=z(1)+conj(H(t,:))*A1'*y(:,t)+y(:,t)'*B1*H(t,:).';
 z(2)=z(2)+conj(H(t,:))*A2'*y(:,t)+y(:,t)'*B2*H(t,:).';
 end
 b_hat=zeros(2,2);
 b_hat(1,1) = (real(z(1)) < 0) ;
 b_hat(1,2) = (imag(z(1)) < 0);
 b_hat(2,1) = (real(z(2)) < 0) ;
 b_hat(2,2) = (imag(z(2)) < 0);
 Count_BER(m,n)=Count_BER(m,n)+sum(abs(b_hat-b),'all');
 end
end
end
BER=Count_BER./(4*N);
semilogy(SNR_dB,BER);
legend('Nr=2','Nr=4','Nr=6','Nr=8');
xlabel('SNR (dB)');
ylabel('Probability of bit errors');