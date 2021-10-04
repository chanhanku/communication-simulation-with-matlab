x = input('enter x\n');
y =  input('enter y\n');
r = (x^(2) + y^(2))^(1/2);
rad = atan(y/x);
deg =(180*rad)/pi;
fprintf('The polar coordinates are ( %6.2f ,%6.2f ).\n',r,deg);