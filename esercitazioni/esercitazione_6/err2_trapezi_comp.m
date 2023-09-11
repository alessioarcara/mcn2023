function err2_trapezi_comp(funz,funzp,a,b,n)
% Funzione che approssima l'integrale definito di una
% funzione mediante la formula dei trapezi composta e
% calcola l'errore.
% funz --> stringa contenente il nome del file in cui e'
%          presente la funzione integranda
% a,b  --> estremi di integrazione
% n    --> numero di sottointervalli
% Viene prodotta la stampa di AbsErr

tol=1.0e-12;
IE=quad(funz,a,b,tol);
eta = genera_eta(a,b);
for i=1:n
    % scelgo il valore di h
    h=1/2^i;
    % calcolo n relativo a h corrente
    n=(b-a)/h;    
    % calcolo valore dell'integrale con trapezi_comp
    IA=trapezi_comp(funz,a,b,n,0);
    
    err_abs(i)=abs(IE-IA);
    err_rel(i)=err_abs(i)/abs(IE);
    err_stima(i)=-(b-a)/12*h^2*feval(funzp, eta);
    
    fprintf('n: %d, Err Ass: %e, Err Rel: %e, Err. Stima: %e \n',n,err_abs(i),err_rel(i),err_stima(i));
end

semilogy(abs(err_stima))
hold on
semilogy((1./2.^(1:10)).^2, 'r')
legend('RT', 'h^2')