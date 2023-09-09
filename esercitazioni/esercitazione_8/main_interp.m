%intervallo di interpolazione
a=-5;
b=5;

for tipo=1:2
    %distribuzione di punti
    switch tipo
        case 1
        disp('Punti equispaziati')
        case 2
        disp('Punti di Chebyshev')
    end
    for n=5:5:20 
        % Genera il vettore x in base al tipo
        switch tipo
        case 1
            x=linspace(a,b,n+1);
        case 2
            x=chebyshev(a,b,n);
        end
        
        % genera le matrici relativi all'interpolazione polinomiale
        % con la forma canonica, la forma di Newton e Bernstein;
        fprintf('n: %i\n', n);
        %Metodo 1: forma canonica (matrice di Vandermonde)
        bv=vandermonde(n, x);
        fprintf('cond matrice vandermonde: %e\n',cond(bv))

        %Metodo 2: forma di Newton
        bn=newton(n, x, x);
        fprintf('cond matrice newton: %e\n',cond(bn))

        %Metodo 3: Bernstein
        bb=bernst(n, x, a, b);
        fprintf('cond matrice bernstein: %e\n',cond(bb))
    end
end