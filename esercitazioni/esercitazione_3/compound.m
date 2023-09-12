%function compound.m
%*******************************************
%Compound Interest: confronto di 5 algoritmi
%per calcolare: (1+x/n)^n
%*******************************************
function [alg1,alg2,alg3,alg4,alg5]=compound(x,n)
if (nargin < 2)
%interesse composto del 5%
    x=0.05;
end

% stiamo guardando quale tra quale di questi algoritmi è il migliore
%
fx=single(x);
fz=1+fx/n;
dz=1+x/n;
w=1;
for i=1:n
  w=w*fz;
end
%fprintf('fz value: %12.8e \n',fz);
%fprintf('dz value: %20.16e \n',dz);
% fprintf('Interesse relativo ad n = %d\n',n);
% fprintf('Alg1: %14.7e \n',w);
alg1=w;

% funzione di matlab
alg2=realpow(fz,n);
% fprintf('Alg2: %14.7e \n',alg2);
    
% sfrutto l'identità logaritmica applicando il logaritmo
% e poi applico la funzione inversa
v=log(fz);
alg3=exp(n*v);
% fprintf('Alg3: %14.7e \n',exp(n*v));

% anche qua sfrutto l'identità logaritmica senza calcolare 1+X
% e si evita la somma che è problematica 
% e poi applica l'esponenziale come funzione inversa
%si usa la function log1p(u):=log(1+u)
%che evita di fare esplicitamente 1+u
u=fx/n;
t=log1p(u);
alg4=exp(n*t);
% fprintf('Alg4: %14.7e \n',exp(n*t));

%si usa l'approssimazione di log(1+u)
%data da u quando 1+u==1 
u=fx/n;
if (1+u == 1)
  t=u;
else
  t=u*(log(1+u)/((1+u)-1));
end
alg5=exp(n*t);
% fprintf('Alg5: %14.7e \n',exp(n*t));
