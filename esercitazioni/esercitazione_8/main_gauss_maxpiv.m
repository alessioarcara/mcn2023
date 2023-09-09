%main_gauss script da completare

%si chiama una funzione che definisce una matrice test
A=mat_es_2;

%si determina la sua dimensione n x m
[n,m]=size(A);

if (n == m)
    %si definisce un vettore x soluzione unitaria nx1
    x=ones(n,1);

    %si determina il vettore dei termini noti
    b=A*x;

    %stampa della matrice A e del vettore b
    disp(A);
    disp(b);

    %si fattorizza la matrice A con Gauss semplice
    [LU,p,sing]=LUmaxpiv(A);
       
    if (sing ~= 1)
    % si stampa la fattorizzazione
      disp(LU)
    %si risolve il sistema lineare
      xx=LUmaxpiv_solve(LU, b, p);
    %si stampa la soluzione x
      disp(xx);
    else
      disp('matrice non fattorizzabile');
    end

end