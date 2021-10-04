[array1,array2] = meshgrid(-10:0.1:10,-10:0.1:10);
q=10^(-13);
r1=((array1-1).^(2)+(array2-1).^(2)+1).^(1/2);
r2=((array1-1).^(2)+(array2+1).^(2)+1).^(1/2);
r3=((array1+1).^(2)+(array2+1).^(2)+1).^(1/2);
r4=((array1+1).^(2)+(array2-1).^(2)+1).^(1/2);
v=(q./(4*pi*8.85*10^(-12).*r1))+(q./(4*pi*8.85*10^(-12).*r2))+(-q./(4*pi*8.85*10^(-12).*r3))+(q./(4*pi*8.85*10^(-12).*r4));
subplot(3,1,1)
mesh(array1, array2, v);
title('\bf Mesh Plot');
xlabel('\bf x');
ylabel('\bf y');
zlabel('V');
subplot(3,1,2)
surf(array1, array2, v);
title('\bf surf Plot');
xlabel('\bf x');
ylabel('\bf y');
zlabel('V');
subplot(3,1,3)
contour(array1, array2, v);
title('\bf Contour Plot');
xlabel('\bf x');
ylabel('\bf y');
zlabel('V');