%script spoly_eval.m
% dc : vettore dei coefficienti (da quello di potenza massima a quella
%      minima)
% da,db : estremi intervallo di definizione
% viene prodotto il grafico della funzione polinomiale nell'intervallo
% di definizione
clc
clear all
close all

dc=[1, -39, 504, -2158]; 
da=10; db=16;

sa=single(da);
sb=single(db);
sc=single(dc);
n=length(dc);

% %punti equispaziati
% nn=101;
% dx=linspace(da,db,nn);

% x=[7.3022, 9.8638, 12.3316, 13.5024];

% h=0.000244140625;
% dx=da:h:db;

% h=2^-7;
% dx=da:h:db;

h=2^-5;
dx=da:h:db;
m=length(dx);
sx=single(dx);

% richiama la function poly_eval
dy=poly_eval(dc,dx);
sy=poly_eval(sc,sx);

%grafico della valutazione double
figure(1);
hold on;
plot(dx,dy,'r.-','LineWidth',1.5);
plot(dx,zeros(1,m),'k-','LineWidth',1.5);

%grafico dell'errore relativo
figure(2);
relerr=abs((sy-dy)./dy);
plot(dx,relerr,'b.-');