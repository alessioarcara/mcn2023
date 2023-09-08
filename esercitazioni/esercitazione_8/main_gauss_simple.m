%main_gauss script da completare

%si chiama una funzione che definisce una matrice test
A=...;

%si determina la sua dimensione n x m
[n,m]=;

if (n == m)
    %si definisce un vettore x soluzione unitaria nx1
    x=ones(n,1);

    %si determina il vettore dei termini noti
    b=A*x;

    %stampa della matrice A e del vettore b
    disp(A);
    disp(b);

    %si fattorizza la matrice A con Gauss semplice
    [LU,sing]=...;
       
    if (sing ~= 1)
    % si stampa la fattorizzazione
      disp(LU)
    %si risolve il sistema lineare
      xx=...;
    %si stampa la soluzione x
      disp(xx);
    else
      disp('matrice non fattorizzabile');
    end

end
