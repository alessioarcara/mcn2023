function polint_lagr_fun(fun_name,a,b,n,tipo)
% Scelta della funzione test
f = str2func(fun_name);

% scelta punti di interpolazione
if (tipo==1)
    %n+1 punti equispaziati
    x=linspace(a,b,n);
else
    %n+1 punti secondo la distribuzione di chebyshev (vedi funzione chebyshev)
    x=chebyshev(a,b,n);
end
y=f(x);
    
B=bernst(n-1,x,a,b);
d=B\y';

%punti su cui valutare l'interpolante polinomiale
m=51;
xv=linspace(a,b,m*n+1);
yv=decast(d,xv,a,b);

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