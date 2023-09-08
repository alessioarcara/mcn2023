function main_interp(n)
% genera le matrici relativi all'interpolazione polinomiale
% con la forma canonica, la forma di Newton e Bernstein;
% input:
% n    : grado del polinomio interpolante

%intervallo di interpolazione
a=-5;
b=5;

%distribuzione di punti
tipo=1;
switch tipo
    case 1
        %punti equispaziati
        x=linspace(a,b,n+1);
    case 2
        %punti di Chebyshev
        x=chebyshev(a,b,n);
end

%Metodo 1: forma canonica (matrice di Vandermonde)
    bv=...;
    fprintf('cond matrice vandermonde: %e\n',cond(bv))
% fprintf('cond matrice vandermonde: %e\n',rcond(bv))

%Metodo 2: forma di Newton
    bn=...;
    fprintf('cond matrice newton: %e\n',cond(bn))
% fprintf('cond matrice newton: %e\n',rcond(bn))

%Metodo 3: Bernstein
    bb=...;
    fprintf('cond matrice bernstein: %e\n',cond(bb))
% fprintf('cond matrice bernstein: %e\n',rcond(bb))
