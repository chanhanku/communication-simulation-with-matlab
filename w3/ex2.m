lc = 2;
lp = 2;
W = 100;
Tmin= (W * lc * lp)/ (0.3*(lp^(2) -0.3^(2))^(1/2)); 
d=0.3:0.1:1.8;
T1= (W * lc * lp)./ (d.*(lp^(2) -d.^(2)).^(1/2)); 
plot(d,T1);
xlabel('distance');
ylabel('T');
for dis=0.3:0.1:1.8
    T2 = (W * lc * lp)/ (dis*(lp^(2) - dis^(2))^(1/2));
    if Tmin > T2
        Tmin = T2;
        dmin=dis;
    end
end
fprintf('Minimum distance found by for loop is:%f\n',dmin);
[A,INDEX]= min(T1);
mind=d(INDEX);
fprintf('Minimum distance found without loop is:%f\n',mind);
