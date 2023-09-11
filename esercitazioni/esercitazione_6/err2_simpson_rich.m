function err2_simpson_comp(funz,a,b,m)
% Funzione che approssima l'integrale definito di una
% funzione mediante la formula di simpson composta e
% calcola l'errore.
% funz --> stringa contenente il nome del file in cui e'
%          presente la funzione integranda
% a,b  --> estremi di integrazione
% n    --> numero di sottointervalli
% Viene prodotta la stampa di AbsErr
    
tol=1.0e-12;
IE=quad(funz,a,b,tol);

for i=1:m
    % scelgo il valore di h
    h=1/2^i;
    % calcolo n relativo a h corrente
    n=(b-a)/h;    
    % calcolo valore dell'integrale con trapezi_comp
    IA(i)=simpson_comp(funz,a,b,n,0);
    
    if i>1
        IA_rich=(16*IA(i)-IA(i-1))/15;
        err_abs_rich(i)=abs(IE-IA_rich);
        err_abs(i)=abs(IE-IA(i));
        fprintf('n: %d, Err. Ass. (standard): %e, Err. Ass. (Rich): %e\n', n, err_abs(i-1), err_abs_rich(i));
    else 
        err_abs(i)=abs(IE-IA(i));
        fprintf('n: %d, Err. Ass. (standard): %e\n', n, err_abs(i));
    end
end
        
semilogy(1:m, err_abs, 'r')
hold on
semilogy(1:m, (1./2.^(1:m)).^4, 'g')
semilogy(2:m, err_abs_rich(2:end), 'b')
semilogy(1:m, (1./2.^(1:m)).^5, 'm')
legend('Err. Ass. (standard)', 'h^4', 'Err. Ass. (Rich)', 'h^5')