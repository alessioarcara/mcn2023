close all
clear all

%definire il vettore punti
x=linspace(10,16);

%definisco il polinomio attraverso i suoi coefficienti
%p rappresenta la funzione f(x)=x->x^3-39x^2+504x-2158
p=[1,-39,504,-2158];

%valuto il polinomio in x con polyval
y=polyval(p,x);

%definisco la derivata prima con polyder
dp=polyder(p);

%valuto la derivata prima
yd=polyval(dp,x);

%grafico polinomio e derivata insieme
plot(x,y,'b-')
hold on
plot(x,yd,'r-')
legend('$f(x)=x^3-39x^2+504x-2158$','$f^{(1)}(x)=3x^2-78x+504$', 'Interpreter', 'latex')