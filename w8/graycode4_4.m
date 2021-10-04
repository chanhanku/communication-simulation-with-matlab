function B = graycode4_4(a)
B = zeros(1,4);
B(1,1) = (real(a) < 0);
B(1,2) = (imag(a) < 0);
B(1,3) = (real(a) > 2 || real(a) < -2);
B(1,4) = (imag(a) > 2 || imag(a) < -2);