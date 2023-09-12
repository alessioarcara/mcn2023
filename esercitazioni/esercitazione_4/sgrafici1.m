clear all
close all

%definire x
x=linspace(-2,2);

%valutare le due funzioni in x
y1=cosh(x);
y2=0.5*exp(x);

%graficare le due funzioni
plot(x,y1,'*-')
hold on
plot(x,y2,'ro--')
legend('y=cosh(x)', 'y=0.5*exp(x)')
title('Grafici primo script')
xlabel('x')
ylabel('y')