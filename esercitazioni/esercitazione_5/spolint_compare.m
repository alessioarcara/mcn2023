close all
clear all

%scelta funzione test e intervallo di definizione
f=@(x) polfun4(x);
a=-1.25;
b=1.25;

%scelta punti di interpolazione
n=40;
x=linspace(a,b,n);
y=f(x);

%punti su cui valutare gli interpolanti polinomiali
m=51;
xv=linspace(a,b,m*n+1);

%interpolante nella forma di newton
N=newton(n,x,x);
c=lsolve(N,y');
ynewt = newtval(c, x, xv);

%interpolante nella forma di lagrange
m=51;
ylagr=lagrval2(y,x,xv);

%valutazione funzione test nei punti di rappresentazione grafica
yf=f(xv);

err_newton=abs(yf-ynewt);
err_lagrange=abs(yf-ylagr);

%grafico errore newton e lagrange
figure(1);
semilogy(xv,err_newton,'b-','LineWidth',2);
hold on;
semilogy(xv,err_lagrange,'r-','LineWidth',2)
legend('Errore Newton', 'Errore Lagrange')

%grafico funzione test, interpolanti e punti
figure(2);
plot(x,y,'ko');
hold on;
plot(xv,ynewt,'b-','LineWidth',2);
plot(xv,ylagr,'r-','LineWidth',2);
plot(xv,yf,'k--','LineWidth',2);
legend('Punti da interpolare', 'Interpolante Newton', 'Interpolante Lagrange', 'Funzione')

err_lagr=abs(yf-ylagr);
err_newt=abs(yf-ynewt);
maxerr_lagr=max(err_lagr);
maxerr_newt=max(err_newt);
fprintf('Max.Err. lagrange: %22.15e, Max.Err. newton: %22.15e\n', maxerr_lagr, maxerr_newt);