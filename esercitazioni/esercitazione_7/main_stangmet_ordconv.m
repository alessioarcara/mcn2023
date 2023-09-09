function main_stangmet(i,x0,tol,ftrace)
% questa funzione chiama stangmet per il metodo di Newton
% o delle tangenti e visualizza graficamente la funzione 
% di cui si cercano gli zeri
% x0  --> iterato iniziale
% tol --> tolleranza richiesta
% ftrace --> 1 stampa successione iterati, 0 no
% Verifica se x0 è NaN
if isnan(x0)
    return
end
if(i<=9)
  funstr=['zfunf0',num2str(i,'%d')];
  funpstr=['zfunp0',num2str(i,'%d')];
else
  funstr=['zfunf',num2str(i,'%d')];
  funpstr=['zfunp',num2str(i,'%d')];
end
fun=str2func(funstr);
%derivate prime
funp=str2func(funpstr);

disp(1)

fx0=feval(fun,x0);
[xstar,n,xs]=stangmet(fun,funp,x0,tol,ftrace);

fprintf('Tabella per funzione zfunf%i\n', i);
err=abs(xs-xstar)';
rapp1=err(2:n)./err(1:n-1);
rapp1=[rapp1;0];
rapp2=err(2:n)./err(1:n-1).^2;
rapp2=[rapp2;0];
rapp3=err(2:n)./err(1:n-1).^3;
rapp3=[rapp3;0];
k=(1:n)';
xk=xs';

table(k, xk, err, rapp1, rapp2, rapp3)
end