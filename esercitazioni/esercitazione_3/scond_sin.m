%script scond_sin.m
%*******************************************************
%condizionamento del problema y=fun(x) con fun(x)=sin(x)
%*******************************************************
clear all;
eps1=2^-12;
eps2=2^-24;
xD = [pi, pi+eps1, pi+eps2, pi/2, pi/2+eps1, pi/2+eps2, eps1, eps2];
xS = single(xD); % force single format
fxS = fun(xS);
fxD = fun(xD);
cond = abs(xD./tan(xD));
relerr = abs((fxD - fxS)./fxD);
%stampa
fprintf (' xD                      f(xS)           f(xD)                 Erel        -log10(Erel)  Cond  log10(cond)\n') ;
for i=1:length(xD)
  fprintf ('%22.15e  %14.7e  %22.15e ', xD(i), fxS(i), fxD(i)) ;
  fprintf ('%e %3.0f  %e  %3.0f\n',relerr(i),-log10(relerr(i)),cond(i),log10(cond(i)));
end

%function secondaria
function y=fun(x)
y=sin(x);
end