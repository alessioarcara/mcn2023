function main_bisez(k,tol)
% questa routine determina uno zero di una funzione test
% di indice k con tolleranza tol con il metodo di bisezione;
% k      --> indice della funzione 1<=k<=18
% tol    --> tolleranza richiesta
% richiede in input l'intervallo di innesco dopo aver visualizzato
% il grafico della funzione nell'intervallo di definizione
close all
if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
end
fun=str2func(funstr);
%intervallo di definizione della funzione
ab=fun();
xa=ab(1);
xb=ab(2);

fplot(fun,[xa xb]);
hold on
plot([xa,xb],[0,0],'r-');

intab=input('dai intervallo di innesco: ');
a=intab(1);
b=intab(2);
if (a < xa)
  a=xa;
end
if (b > xb)
  b=xb;
end
plot([a,b],[0,0],'g-','LineWidth',1.5);
fprintf('[a,b]: %20.15e %20.15e\n',a,b);

ftrace=1
[xstar,n,ak, bk]=bisez(fun,a,b,tol,ftrace);

plot(xstar,0,'g+');
fprintf('zero: %20.15e\n',xstar);
fprintf('numero iterazioni effettuate: %i\n', n);
for i=1:length(ak)
    fprintf('%i° intervallo ab=(%e, %e)\n', i, ak(i), bk(i));
end
end
