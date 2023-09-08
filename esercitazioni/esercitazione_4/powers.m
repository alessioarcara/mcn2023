function ps = powers(g,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function ps = powers(g,x)
% Calcola le funzioni della base canonica (base delle potenze) in un punto;
% se x e' un vettore torna una matrice; in ogni riga ci sono
% i valori delle funzioni base in un punto.
% g --> grado del polinomio
% x --> vettore di punti
% ps <-- matrice delle funzioni potenze nei punti (Vandermonde)

xx=x';
m=length(x);
n=g+1;
ps=zeros(m,n);
ps(:,1)=ones(m,1);
for k=2:n
    ps(:,k)=ps(:,k-1).*xx;
end

end