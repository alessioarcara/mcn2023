%main_stab_lufact script da completare

%si chiama funzione che definisce una matrice test
A=mat_es_7();

%si determina la sua dimensione n
[n,m]=size(A);

%stampa della matrice A
disp(A);
xstar = ones(2,1)
%si definisce il vettore dei termini noti
% b=[1 ; 2];
b = A*xstar;

%si fattorizzi la matrice A usando la function LUmaxpiv
[LU, p, sing]=LUmaxpiv(A);

%si risolvono i sistemi piu' semplici usando la function LUmaxpiv_solve
if sing==1
    disp('fattorizzazione LU senza pivoting non riuscita')
else 
    disp('Soluzione LU con pivoting')
    x1=LUmaxpiv_solve(LU, b, p)
end

%si fattorizzi la matrice A usando la function LUsimple
[LU, sing]=LUsimple(A);

if sing==1
    disp('fattorizzazione LU senza pivoting non riuscita')
else 
    disp('Soluzione LU senza pivoting')
    x2=LUsimple_solve(LU, b)
end