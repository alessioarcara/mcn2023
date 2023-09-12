% script spolint_lagr_dati.m
% Interpolante polinomiale di un set di dati: forma di Lagrange;
% viene prodotto il grafico del data set e del polinomio interpolante
clear all
close all
A=load('dataset1.dat');
[n m]=size(A);
x=A(:,1)';
y=A(:,2)';

a=min(x);
b=max(x);

%punti su cui valutare l'interpolante polinomiale per il grafico
xv = linspace(a, b, 100);
% i coeff. sono i dati y;
% valutazionen mediante II forma di Lagrange con lagrval2
yv = lagrval2(y, x, xv);

%grafico dati (x,y) e valori polinomio interpolante (xv,yv)
figure(1)
plot(x,y,'or','LineWidth',1.5);
hold on;
plot(xv,yv,'b','LineWidth',2);
