m = input('enter the value of m:');
ran = random0(m);
mean(ran)
std(ran)
hist(ran,6)
title('\bfHistogram of the Output of random0');
xlabel('Bin');
ylabel('Count');