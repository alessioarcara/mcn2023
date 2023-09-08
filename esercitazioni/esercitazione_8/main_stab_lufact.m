%main_stab_lufact script da completare

%si chiama funzione che definisce una matrice test
A=mat_es_7();

%si determina la sua dimensione n
[n,m]=size(A);

%stampa della matrice A
disp(A);

%si definisce il vettore dei termini noti
b=[1 ; 2];

%si fattorizza la matrice A
[]=LUmaxpiv(A);

%si risolvono i sistemi piu' semplici usando la function LUmaxpiv_solve
x1=...;

%si stampa la soluzione x1
disp(x1);

%si fattorizzi la matrice A usando la function LUsimple
...

%si risolva il sistema lineare usando la function LUsimple_solve
x2=...;

%si stampa la soluzione x2
disp(x2);
