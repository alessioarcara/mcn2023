close all
clear all

%definire il vettore punti
x=linspace(10,16);

%definisco il polinomio attraverso i suoi coefficienti
%p rappresenta la funzione f(x)=x->x^3-39x^2+504x-2158
p=[1,-39,504,-2158];

%valuto il polinomio e la derivata con function poly_eval_der
[y,y1]=poly_eval_der(p,x);

%grafico polinomio e derivata insieme
plot(x,y,'b-')
hold on
plot(x,y1,'r-')
legend('$f(x)=x^3-39x^2+504x-2158$','$f^{(1)}(x)=3x^2-78x+504$', 'Interpreter', 'latex')