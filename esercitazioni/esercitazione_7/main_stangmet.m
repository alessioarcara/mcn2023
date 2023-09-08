function main_stangmet(k,x0,tol,ftrace)
% questa funzione chiama stangmet per il metodo di Newton
% o delle tangenti e visualizza graficamente la funzione 
% di cui si cercano gli zeri
% k   --> indice della funzione
% x0  --> iterato iniziale
% tol --> tolleranza richiesta
% ftrace --> 1 stampa successione iterati, 0 no

if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
  funpstr=['zfunp0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
  funpstr=['zfunp',num2str(k,'%d')];
end
fun=str2func(funstr);
%derivate prime
funp=str2func(funpstr);

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

[xstar,n,xs]=stangmet(fun,funp,x0,tol,ftrace);
plot(xstar,0,'g+');
hold on
axis([xa,xb,-4,4]);

if (ftrace>0)
 for i=1:n
  fprintf('%d: %20.15e\n',i,xs(i));
 end
end

fprintf('zero: %20.15e\n',xstar);
fprintf('numero iterazioni effettuate: %d\n',n);

end
