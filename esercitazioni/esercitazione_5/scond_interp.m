%script scond_interp.m
%Questo codice vuole esaminare il condizionamento dell'interpolazione polinomiale
%calcolanto e stampando la costante di Lebesgue associata
clear all
close all
%scelta dei punti di interplazione
tipo=1;
%scelta del grado del polinomio interpolante
n=11;
%estremi dell'intervallo di interpolazione
a=-2;
b=1;
%setting dei punti di interpolazione
switch (tipo)
    case 1
%n+1 punti equispaziati
      x=linspace(a,b,n+1);
    case 2
%n+1 punti secondo la distribuzione di chebyshev
      x=chebyshev(a,b,n);
end

%punti su cui valutare il condizionamento
m=51;
xv=linspace(a,b,m*n+1);
Lin=lagrange(n,x,xv);
CI=sum(abs(Lin'));

%apertura finestra grafica
figure(tipo);
hold on;

%grafico Condizionamento polinomio interpolante
plot(xv,CI,'LineWidth',2);

%max condizionamento
ncond=max(CI);
fprintf('Numero di condizione: %22.15e\n',ncond);

