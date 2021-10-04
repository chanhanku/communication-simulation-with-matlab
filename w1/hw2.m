r = input('enter r\n');
theta =  input('enter theta\n');
rad = (theta*pi)/180;
x=r*cos(rad);
y=r*sin(rad)
fprintf('The  rectangular coordinates are ( %6.2f ,%6.2f ).\n',x,y);