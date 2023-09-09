function main_fzero(k,x0)
% questa funzione chiama stangmet per il metodo di Newton
% o delle tangenti e visualizza graficamente la funzione 
% di cui si cercano gli zeri
% k   --> indice della funzione
% x0  --> iterato iniziale
% tol --> tolleranza richiesta
% ftrace --> 1 stampa successione iterati, 0 no

if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
  % funpstr=['zfunp0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
  % funpstr=['zfunp',num2str(k,'%d')];
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

options = optimset ('Display','iter');
[xstar, fval, exitflag, output]=fzero(fun,x0, options);
plot(xstar,0,'g+');
hold on
axis([xa,xb,-4,4]);

fprintf('algoritmo: %s\n', output.algorithm)
fprintf('zero: %20.15e\n',xstar);
fprintf('numero iterazioni effettuate: %d\n', output.iterations);

end
