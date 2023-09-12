clear all
close all

%definire x
x1=linspace(-3,3);
x2=linspace(-6,6);
x3=linspace(0,2*pi);
x4=linspace(-6*pi,6*pi);

%valutare le due funzioni in x
f1=@(x) x.^3-4*x;
f2=@(x) 0.2*x.^4+x.^3-0.4*x.^2-3*x+1;
f3=@(x) 3*cos(2*x)-2*cos(x);
f4=@(x) sin(2*x)./x;

%graficare le due funzioni
figure(1)
plot(x1,f1(x1),'b--')
title('$x^3-4x$','Interpreter','latex')
xlabel('x')
ylabel('y')

figure(2)
plot(x2,f2(x2),'b--')
title('$0.2x^4+x^3-0.4x^2-3x+1$','Interpreter','latex')
xlabel('x')
ylabel('y')

figure(3)
plot(x3,f3(x3),'b--')
title('$3\cos(2x)-2\cos(x)$','Interpreter','latex')
xlabel('x')
ylabel('y')

figure(4)
plot(x4,f4(x4),'b--')
title('$\frac{\sin(2x)}{x}$','Interpreter','latex')
xlabel('x')
ylabel('y')