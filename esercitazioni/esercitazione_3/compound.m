%function compound.m
%*******************************************
%Compound Interest: confronto di 5 algoritmi
%per calcolare: (1+x/n)^n
%*******************************************
function compound(n,x)
if (nargin < 2)
%interesse composto del 5%
    x=0.05;
end

fx=single(x);
fz=1+fx/n;
dz=1+x/n;
w=1;
for i=1:n
  w=w*fz;
end
%fprintf('fz value: %12.8e \n',fz);
%fprintf('dz value: %20.16e \n',dz);
fprintf('Interesse relativo ad n = %d\n',n);
fprintf('Alg1: %14.7e \n',w);
fprintf('Alg2: %14.7e \n',realpow(fz,n));
v=log(fz);
fprintf('Alg3: %14.7e \n',exp(n*v));

%si usa la function log1p(u):=log(1+u)
%che evita di fare esplicitamente 1+u
u=fx/n;
t=log1p(u);
fprintf('Alg4: %14.7e \n',exp(n*t));

%si usa l'approssimazione di log(1+u)
%data da u quando 1+u==1 
u=fx/n;
if (1+u == 1)
  t=u;
else
  t=u*(log(1+u)/((1+u)-1));
end
fprintf('Alg5: %14.7e \n',exp(n*t));
