% script spolint_lagr_fun.m
% Interpolante polinomiale di grado n di una funzione test:
% si utilizza la forma di Lagrange;
% scegliere la funzione test
% n      : grado del polinomio interpolante
% tipo   : tipo di distribuzione dei punti 1=equispaziati 2=chebyshev
% Viene prodotto il grafico della funzione test, del polinomio interpolante
% e dei punti di interpolazione
clear all
close all

%setting per la funzione test: vedere le funzioni test
%presenti nella cartella
%funzione test ed estremi intervallo di definizione
f =@(x) fun1(x);
a=-pi;
b=pi;

%setting del grado del polinomio e dei punti di interpolazione
n=5;
tipo=1;
if (tipo==1)
    %n+1 punti equispaziati
    x=...;
else
    %n+1 punti secondo la distribuzione di chebyshev (vedi funzione chebyshev)
    x=...;
end

%n+1 osservazioni campionate dalla funzione test 
y=f(x);

%punti su cui valutare l'interpolante polinomiale modo 1
m=20;
xv=linspace(a,b,m*n+1);

% %punti su cui valutare l'interpolante polinomiale (modo 2)
% in=0;
% for i=1:n
%    xv(in+1:in+m)=linspace(x(i),x(i+1),m);
%    in=in+m-1;
% end

%Metodo di interpolazione: forma di Lagrange (i coeff. sono i dati y)

%valutazione nella II forma di Lagrange (vedi la function lagrval2)
yv=...;

%valutazione funzione test nei punti di rappresentazione grafica
yf=f(xv);

%apertura finestra per grafico funzione test, interpolante e punti
figure(1);
hold on;

%grafico funzione test
plot(xv,yf,'r-','LineWidth',2);

%grafico funzione polinomiale interpolante
plot(xv,yv,'g-','LineWidth',2);

%disegno punti di interpolazione
plot(x,y,'ro');

%grafico errore di interpolazione
yerr=abs(yf-yv );
figure(2);
hold on
plot(xv,yerr,'g-','LineWidth',2);

%grafico errore di interpolazione in scala logaritmica
% figure(3);
% semilogy(xv,yerr,'g-',,'LineWidth',2);

%calcola e stampa max. dell'errore analitico in [a,b]
error=max(yerr);
fprintf('Errore interpolazione: %22.15e\n',error);
