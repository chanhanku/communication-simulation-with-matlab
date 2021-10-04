A = fopen('C:\Users\user\Documents\w3\input3.dat','r');
[B,count]=fscanf(A,'%f');
C=B.';
n=input('enter the n:');
if mod(n,2)==0
    n=n+1;
end
length=(n-1)/2;
for ii=1:count
  co=0;
  sum=0;
  if ii <= length
      for jj=1:2*ii-1
      sum=sum+C(jj);
      co=co+1;
      end
      avg= sum /co;
  elseif (count-ii) <= length
      for gg = (2*ii-count+1):count
          sum=sum+C(gg);
          co=co+1;
      end
      avg= sum /co;
  else
      for  kk = (ii-length) : (ii+length)
          sum=sum+C(kk);
      end
      avg=sum/n;
  end    
  C(ii)=avg ;    
end 
plot(1:count,C);
hold on;
plot(1:count,B);