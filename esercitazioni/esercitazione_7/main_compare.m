function main_compare(k,x0,x1)
% questa funzione chiama ssecmet per il metodo delle secanti
% e visualizza graficamente la funzione di cui si cercano gli zeri
% k     --> indice della funzione
% x0,x1 --> iterati iniziali
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
    
n_values=2:11;
tvals = zeros(length(n_values), 1);
svals = zeros(length(n_values), 1);
tols=10.^(-n_values);
ftrace=0;
    
for n=n_values
    tol = tols(n - 1);
    [~, n1, ~] = stangmet(fun, funp, x0, tol, ftrace);
    [~, n2, ~] = ssecmet(fun, x0, x1, tol, ftrace);
    tvals(n - 1) = 2 * n1;  % Usa n - 1 come indice perché n inizia da 2
    svals(n - 1) = n2;
end

disp(table(tols', tvals, svals));
% Creazione del grafico
id=figure;
semilogx(tols, tvals, 'r-o');
hold
semilogx(tols, svals, 'b-x');
title('Confronto costo computazionale Newton e Secanti')
xlabel('Tol');
ylabel('N. di valutazioni di funzione');
legend('Newton', 'Secanti');
