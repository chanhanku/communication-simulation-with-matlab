
d = (0:15)';
b = de2bi(d,'left-msb');
G = [1 0 0 0 1 1 1;0 1 0 0 1 1 0;0 0 1 0 1 0 1;0 0 0 1 0 1 1];
u = mod( b * G,2)
