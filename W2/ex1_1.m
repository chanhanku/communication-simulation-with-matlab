f=100*10^(3):10^(3):10*10^(6);
Current=120./(100+2*pi*0.1*10^(-3).*f*i-(i./(2*pi*0.25*10^(-9).*f)));
subplot(2,1,1);
plot(f,abs(Current))
xlabel('f');
ylabel('\bfI');
subplot(2,1,2);
semilogx(f,abs(Current));
xlabel('f');
ylabel('\bfI');

