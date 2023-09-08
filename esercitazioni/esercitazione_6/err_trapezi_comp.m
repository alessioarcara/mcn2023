function err_trapezi_comp(funz,a,b,n)
% Funzione che approssima l'integrale definito di una
% funzione mediante la formula dei trapezi composta e
% calcola l'errore.
% funz --> stringa contenente il nome del file in cui e'
%          presente la funzione integranda
% a,b  --> estremi di integrazione
% n    --> numero di sottointervalli
% Viene prodotta la stampa di AbsErr

  tol=1.0e-12;
  I=quad(..,..,..,..);
  fprintf('valore I= %22.15e\n',I);
  
  h=(b-a)/n;
  IA=trapezi_comp(..,..,..,..,0);
  AbsErr=abs(..);
  fprintf('n  h  IA  AbsErr\n');
  fprintf('%d %14.7e %22.15e %14.7e \n',n,h,IA,AbsErr);

