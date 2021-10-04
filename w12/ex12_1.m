
clear all;
SNR_dB =[1 2 3 4 5 6 7 8 ] ;

count=zeros(1,length(SNR_dB));
% possible codewords
d = (1:2^11)';
b = de2bi(d-1,11,'left-msb');
% G--------------------------------------
H =[1 1 0 1 0 1 0 1 0 1 0 0 1 0 1 ;1 1 1 1 0 0 0 0 0 0 1 1 1 1 0;1 0 1 1 1 0 0 1 1 0 0 1 0 0 1;0 1 1 1 1 1 1 0 0 0 1 0 0 0 1];
H_temp = zeros(4,15);
H_temp(:,1:4) = H(:,12:15);
H_temp(:,5:15) = H(:,1:11);
H_p = rref(H_temp);
H_p = mod(H_p , 2);
P_trans = transpose(H_p(:,5:15));
I_G = eye(11);
G =zeros(11,15);
G(:,1:11) = I_G;
G(:,12:15) = P_trans;
u = mod( b * G,2);
%--------------------
for pp=1:length(SNR_dB)
 SNR=10^(SNR_dB(pp)/10);
 N0=1/((11/15)*SNR);
while(1)
    if count(pp)>=100
    break
 %-----------------------------------
 %generate received signal
 f = randi(2^11)-1;
 x=(-1).^u((f+1),:); % {0 1}-->{1 -1}
 w=(randn(1,15))*sqrt(N0/2);
 y=x+w;
 %-------------------------------------
 %hard decision
 
    for ii = 1:15
     if y(1,ii) >= 0
        y(1,ii)=0;
     else
        y(1,ii)=1;
     end
    end
    Hz =mod( H *transpose(y-x) , 2);
    for qq = 1:15
        if H(:,qq) == Hz
            y(1,qq) = ~y(1,qq);
        end
    end
   count(pp) = count(pp)+ sum(mod(y+u(f+1,:),2));
    end  
end

end
BER=count./(11*Nt);