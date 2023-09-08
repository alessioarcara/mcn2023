%main_linsys da completare per risolvere un sistema lineare Ax=b

%si chiama una funzione che definisce una matrice test
A=..;

%sia n x m la sua dimensione
[n,m]=..;

if (n==m)
    
    %si definisce un vettore xx soluzione
    xx=ones(n,1);

    %si determina il vettore dei termini noti
    b=..;

    %stampa della matrice A e del vettore dei termini noti b
    ...

    %si risolve il sistema lineare utilizzando l'operatore left division
    xld=...

    %si stampa la soluzione xld
    ...

    %si fattorizza la matrice A usando la function Matlab lu()
    ...

    %si risolvono i due sistemi piu' semplici usando le function 
    %lsolve() e usolve() presenti nella cartella
    y=..;
    x=..;

    %si stampa la soluzione x del sistema lineare
    ...

end