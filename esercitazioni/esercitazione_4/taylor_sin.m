%function taylor_sin.m
%Sviluppo polinomiale di taylor di grado n centrato in x0 
%della funzione sin(x) e grafico in [0,3*pi].
%input:
% n  --> grado >= 0
% x0 --> valore in [0,3pi]
function taylor_sin(n,x0)
%RAPPRESENTAZIONE ESATTA: valutazione e disegno di sin(x)
a=0;
b=3*pi;
m=100;
x=linspace(a,b,m);
ys=sin(x);

%disegno della funzione sin(x)
figure(1)
title('sviluppo di Taylor di sin(x)')
hold on
wmin=-2.5;
wmax=2.5;
axis([a,b,wmin,wmax]);
plot(x,ys,'r-');

%APPROSSIMAZIONE: sviluppo di Taylor di sin(x)
sinx0=sin(x0);
cosx0=cos(x0);
%derivate
sc=[sinx0,cosx0,-sinx0,-cosx0];
c=zeros(1,n+1);
c(1)=sc(1);
for i=1:n
  j=mod(i,4)+1;
  c(i+1)=sc(j)/factorial(i);
end

%valutazione e disegno dello sviluppo polinomiale
xx=x-x0;
c=fliplr(c);
yp=polyval(c,xx);
plot(x,yp,'b-');
legend('Seno', 'Polinomio di Taylor')

%valutazione Errore Analitico assoluto discreto in un intorno my_eps di x0
my_eps=0.5;
ex=linspace(x0-my_eps,x0+my_eps,m);
eysin=sin(ex);
exx=ex-x0;
eypol=polyval(c,exx);
plot([x0-my_eps,x0+my_eps],[sinx0,sinx0],'g-','LineWidth',1.5);

abserr=max(abs(eysin-eypol));
fprintf('Errore Assoluto in un intorno di x0: %e\n',abserr);
figure(2)
hold on
plot(ex,abs(eysin-eypol),'LineWidth',1.5);