AnnualIncome = input('enter your annual income:');
if 0 <= AnnualIncome && AnnualIncome<= 6000;
    tax_2002 = 0;
elseif  6000 < AnnualIncome && AnnualIncome <= 20000
    tax_2002 = (AnnualIncome - 6000) * 0.17;
elseif 20000 < AnnualIncome && AnnualIncome <= 50000
    tax_2002 = 2380 + (AnnualIncome - 20000) * 0.3;
elseif 50000 < AnnualIncome && AnnualIncome <= 60000
    tax_2002 = 11380 + (AnnualIncome - 50000) * 0.42;
else
    tax_2002 = 15580 + (AnnualIncome - 60000) * 0.47;
end
if 0 <= AnnualIncome && AnnualIncome<= 6000;
    tax_2009 =0;
elseif  6000 < AnnualIncome && AnnualIncome <= 34000;
    tax_2009 = (AnnualIncome - 6000) * 0.15;
elseif 34000 < AnnualIncome && AnnualIncome<= 80000;
    tax_2009 = 4200 + (AnnualIncome - 34000) * 0.3;
elseif 80000 < AnnualIncome && AnnualIncome<= 180000;
    tax_2009 = 18000 + (AnnualIncome - 80000) * 0.4;
else
    tax_2009 = 58000 + (AnnualIncome - 180000) * 0.45;
end
extramoney = tax_2002 - tax_2009 ;
fprintf ('the tax you need to pay in 2002 is: %f\n',tax_2002);
fprintf ('the tax you need to pay in 2009 is: %f\n',tax_2009);
fprintf('the difference is: %f\n',extramoney);