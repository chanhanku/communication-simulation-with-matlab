clear all;
SNR_dB=[0 3 6 9 12];
k = [0.5 1 2 4];
Nt=10^5;
x_gray = zeros(1,2);
r_gray = zeros(1,2);
for m = 1 : length(k)
    Count_BER=zeros(1,length(SNR_dB));
    Count_p=zeros(1,length(SNR_dB));
    for n = 1:length(SNR_dB)
        SNR=10^(SNR_dB(n)/10);
        N0=1/(SNR);
        for t=1:Nt
        %-----------------------------------
        %generate received signal
        b1=floor(rand(1)*2); 
        b2=floor(rand(1)*2); 
        x1 = (-1)^b1;
        x2 = (-1)^b2;
        x = x1 + 1j * x2;
    x_gray(1,1) = (x2 < 0);
    x_gray(1,2) = (x1 < 0);
    h = sqrt(k(m)/(k(m)+1))*exp(j*(pi/4))+sqrt(1/(k(m)+1))*(randn(1)+j*randn(1))*sqrt(1/2);
    w=(randn(1)+j*randn(1))*sqrt(N0/2); % AWGN r=[n1, n2, n3,n4]
    y=h*x+w;
    %-------------------------------------
    %Detection
    r=y/h;
    r_gray(1,1) = (imag(r) < 0);
    r_gray(1,2) = (real(r) < 0);
    Count_BER(n) = Count_BER(n) + sum(abs(x_gray - r_gray)) ;
    
    p = 2*SNR*(abs(h))^2;
    if p < 3
        Count_p(n) = Count_p(n)+1;
    end
    end
    end
    figure(1);
    BER=Count_BER./(2*Nt);
    semilogy(SNR_dB,BER,'b-.');
    legend('BER');
xlabel('SNR (dB)');
ylabel('Probability of bit errors');
    hold on
    figure(2);
    p_prob = Count_p ./ Nt;
    semilogy(SNR_dB,p_prob,'r-.');
    legend('p_prob');
    xlabel('SNR (dB)');
    ylabel('Probability of p');
    hold on
end
