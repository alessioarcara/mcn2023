function spolint_lagr_fun(n,tipo)
% script spolint_lagr_fun.m
% Interpolante polinomiale di grado n di una funzione test:
% si utilizza la forma di Lagrange;
% scegliere la funzione test
% n      : grado del polinomio interpolante
% tipo   : tipo di distribuzione dei punti 1=equispaziati 2=chebyshev
% Viene prodotto il grafico della funzione test, del polinomio interpolante
% e dei punti di interpolazione

% scelta funzione test e intervallo di definizione
f=@(x) runge(x);
a=-5;
b=5;

% scelta punti di interpolazione
if (tipo==1)
    %n+1 punti equispaziati
    x=linspace(a,b,n);
else
    %n+1 punti secondo la distribuzione di chebyshev (vedi funzione chebyshev)
    x=chebyshev(a,b,n);
end
y=f(x);

%punti su cui valutare l'interpolante polinomiale
m=51;
xv=linspace(a,b,m*n+1);
yv=lagrval2(y,x,xv);

%valutazione funzione test nei punti di rappresentazione grafica
yf=f(xv);

%apertura finestra per grafico funzione test, interpolante e punti
figure(1);
%disegno punti di interpolazione
plot(x,y,'ko');
hold on;
%grafico funzione polinomiale interpolante
plot(xv,yv,'r-','LineWidth',2);
%grafico funzione test
plot(xv,yf,'k--','LineWidth',2);
legend('Punti da interpolare', 'Interpolante polinomiale', 'Funzione')

%calcola e stampa max. dell'errore analitico in [a,b]
%grafico errore di interpolazione
err=abs(yf-yv);
maxerr=max(err);
fprintf('Errore interpolazione: %22.15e\n',maxerr);
figure(2);
semilogy(xv,err,'g-','LineWidth',2);