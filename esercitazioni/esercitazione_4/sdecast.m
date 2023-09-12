close all
clear all

%g grado polinomio
%cP coefficienti base dei monomi...
%cB coefficienti base di Bernstein
[g,cP,cB]=def_pol(3);

%i polinomi sono definiti in [0,1]
x=linspace(0,1);
y=decast(cB,x);

plot(x,y,'r-')