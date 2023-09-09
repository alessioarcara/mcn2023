function main_ssecmet(k,x0,x1,tol,ftrace)
% questa funzione chiama ssecmet per il metodo delle secanti
% e visualizza graficamente la funzione di cui si cercano gli zeri
% k     --> indice della funzione
% x0,x1 --> iterati iniziali
% tol   --> tolleranza richiesta
% ftrace --> 1 stampa successione iterati, 0 no
if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
end
fun=str2func(funstr);

%intervallo di definizione delle funzioni
ab=fun();
xa=ab(1);
xb=ab(2);

id=figure;
fplot(fun,[xa xb]);
hold on
plot([xa,xb],[0,0],'r-');
fx0=feval(fun,x0);
plot(x0,0,'r+');
plot(x0,fx0,'ro');
fx1=feval(fun,x1);
plot(x1,0,'b+');
plot(x1,fx1,'bo');

[xstar,n,xs]=ssecmet(fun,x0,x1,tol,ftrace);
plot(xstar,0,'g+');

if (ftrace>0)
 for i=1:n
  fprintf('%d: %20.15e\n',i,xs(i));
 end
end

fprintf('zero: %20.15e\n',xstar);
fprintf('numero iterazioni effettuate: %d\n',n);