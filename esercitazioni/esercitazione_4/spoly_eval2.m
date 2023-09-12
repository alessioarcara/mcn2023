%script spoly_eval2.m
% d : vettore dei COEFFICIENTI (da quello di potenza massima a quella
%     minima)
% a,b : estremi intervallo di definizione
% viene prodotto il grafico della funzione polinomiale nell'intervallo
%function spoly_eval2(gc)
clc
clear all
close all

gc=2;
switch gc
    case 1 % coefficienti numeri finiti, discretizzazione no
       d=[100,-1];
       d=fliplr(d);  a=100;  b=101;
    case 2 % a_0 non finito, a_1 e discretizzazione si
       d=[99.9,-1];
       d=fliplr(d);  a=100;  b=101;
    case 3 % a_1 non finito, a_0 e discretizzazione si 
       d=[100,-1.001];
       d=fliplr(d);  a=100;  b=101;
    case 4 % a_0, a_1 e discretizzazione sono numeri finiti
       d=[100,-1];
       d=fliplr(d);  a=100;  b=101;
end

c=d;
sc=single(c);
n=length(c);

%punti equispaziati
if gc==1
    m=51;
    x=linspace(a,b,m);
else
    x=[7.3022, 9.8638, 12.3316, 13.5024];

    h=0.000244140625;
    x=a:h:b;

    % h=2^-7;
    % x=a:h:b;
    % sx=single(x);

    % h=2^-5;
    % x=a:h:b;

    m=length(x);
end

sx=single(x);
% disp('numero di punti') 
% disp(length(x));
% disp (x==sx)

% % y=polyval(c,x); %function di Matlab
% y=polyval(c,x);
% sy=polyval(double(sc),double(sx));

% % y=poly_eval(c,x); %function nostra
y=poly_eval(c,x);
sy=poly_eval(double(sc),double(sx));

figure(1);
hold on;
plot(x,y,'r.-','LineWidth',1.5);
plot(x,zeros(1,m),'k-','LineWidth',1.5);

figure(2);
relerr=abs((sy-y)./abs(y));
plot(x,relerr,'b.-');