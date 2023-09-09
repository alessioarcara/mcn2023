%main_linsys da completare per risolvere un sistema lineare Ax=b

%si chiama una funzione che definisce una matrice test
A=mat_es_2;

%sia n x m la sua dimensione
[n,m]=size(A);

if (n==m)
    
    %si definisce un vettore xx soluzione
    xstar=ones(n,1);

    %si determina il vettore dei termini noti
    b=A*xstar;

    %stampa della matrice A e del vettore dei termini noti b
    A, b

    %si risolve il sistema lineare utilizzando l'operatore left division
    xld=A\b;
    err1 = norm(xstar-xld)/norm(xstar);

    %si stampa la soluzione xld
    xld

    % fattorizzazione LU (senza pivoting)
    % lu di matlab non fa la fattorizzazione senza pivoting, 
    % con sparse() forzo LU senza pivoting
    % [L, U] = lu(A) può rendere L non triangolare inferiore a causa del pivoting.
    [L,U]=lu(sparse(A),0);
    %si risolvono i due sistemi piu' semplici usando le function 
    %lsolve() e usolve() presenti nella cartella
    y=lsolve(L, b);
    x1=usolve(U, y);
    err2 = norm(xstar-x1)/norm(x1);
    
    % fattorizzazione LU (con pivoting)
    [L,U,P]=lu(A);
    y=lsolve(L, P*b);
    x2=usolve(U, y);
    err3 = norm(xstar-x2)/norm(x2);

    fprintf('Errori\n * left division: %e,\n * LU (no pivoting): %e,\n * LU (con pivoting): %e', err1, err2, err3);
end