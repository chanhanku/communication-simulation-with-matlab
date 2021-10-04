y=zeros(1,6);
for ii=1:10^5
    x=rand(1);
    if x>=0 && x<=0.2
        y(1,1)=y(1,1)+1;
    elseif x>0.2 && x<=0.35
        y(1,2)=y(1,2)+1;
    elseif x>0.35 && x<=0.55
        y(1,3)=y(1,3)+1;
    elseif x>0.55 && x<=0.7
        y(1,4)=y(1,4)+1;
    elseif x>0.7 && x<=0.9
        y(1,5)=y(1,5)+1;
    else
        y(1,6)=y(1,6)+1;
    end
end
bar(y);