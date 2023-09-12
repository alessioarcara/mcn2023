function y=decast(c,x)
% calcola il valore di un polinomio nella base di Bernstein in [0,1]
% definito dai coefficienti c, nei punti x mediante l'algoritmo di
% de Casteljau
% c --> coefficienti del polinomio
% x --> vettore dei punti
% y <-- valore del polinomio nei punti
n=length(c);
g=n-1;
m=length(x);
for ii=1:m
 w=c;
 d1=x(ii);
 d2=1.0-x(ii);
 for j=1:g
  for i=1:g-j+1
   w(i)=d1.*w(i+1)+d2.*w(i);
  end
 end
 y(ii)=w(1);
end