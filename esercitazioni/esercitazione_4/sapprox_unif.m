function sapprox_unif(g,k)
% Polinomio di Bernstein di approssimazione uniforme di una funzione test
% input: g --> grado del polinomio
%        k --> indice funzione
% output: grafico della funzione polinomiale approssimante
%         e della funzione fun e grafico della funzione errore


n=501;
switch (k)
    case 1
        a=-2; b=2;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=cosh(xi);
        y=cosh(x);
    case 2
        a=-2; b=2;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=0.5*exp(xi);
        y=0.5*exp(x);
    case 3
        a=-3; b=3;
        d=[1 0 -4 0];
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=polyval(d,xi);
        y=polyval(d,x);
    case 4
        a=-6; b=6;
        d=[0.2 1 -0.4 -3 1];
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=polyval(d,xi);
        y=polyval(d,x);
    case 5
        a=0; b=2*pi;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1)
        c=3*cos(2.*xi)-2*cos(xi);
        y=3*cos(2.*x)-2*cos(x);
    case 6
        a=-6*pi; b=6*pi;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=sin(2.*xi)./xi;
        y=sin(2.*x)./x;
    case 7
        a=0; b=1;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=sqrt(1-xi);
        y=sqrt(1-x);
end

% %algoritmo formula ricorrente base Bernstein in [0,1]
% bma=b-a;
% t=(x-a)/bma;
% bs=bernst01(g,t);
% yy=(bs*c')';

%algoritmo formula ricorrente base Bernstein in [a,b]
bs=bernst(g,x,a,b);
%prodotto vettore 1xn per matrice nxn
yy=(bs*c')';

% %algoritmo di de Casteljau in [0,1]
% t=(x-a)/(b-a);
% yy=decast(c,t);

figure(1)
plot([a,b]',[0,0]','r');
hold on;
plot(x,y,'g-');
plot(x,yy,'r-');
% per visionare l'interpretazione geometrica sui coefficienti
plot(linspace(a,b,g+1),c,'b+-');
legend('funzione', 'polinomio di Bernstein')

figure(2)
hold on;
err=abs(y-yy);
plot(x,err,'g-');
fprintf('Max.Err. %e\n',max(err));



