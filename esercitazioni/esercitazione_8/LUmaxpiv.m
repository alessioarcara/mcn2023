%*******************************************************************
%* Fattorizza una matrice in LU con L triangolare inferiore e U    *
%* triangolare superiore usando il metodo di eliminazione di Gauss *
%* con scambio delle righe (pivoting parziale) e perno massimo.    *
%* Utilizza la function swap (vedi sotto).                         *
%* input : A matrice da fattorizzare                               *
%* output: A matrice contenente le informazioni sulla L e la U     *
%*         p vettore degli scambi di riga; p(i) contiene l'indice  *
%*           della riga con cui e' stata scambiata la i-esima riga;*
%*           p(n+1) contiene +1 o -1 a seconda che siano stati     *
%*           necessari un numero pari o dispari di scambi          *
%*         sing (0) la matrice non e' singolare, (1) e' singolare  *
%*******************************************************************

function [A,p,sing]=LUmaxpiv(A)

  [m,n]=size(A);
  sing = 0;
  p(n) = 1;
  k = 1;
  while ((~sing) & (k<n)) 
    [val,s] = max(abs(A(k:n,k)));
    s=s+k-1;
    p(k) = s;
    if(s ~= k)
      p(n) = -p(n);
      [A(s,k:n),A(k,k:n)]=swap(A(s,k:n),A(k,k:n));
    end
    if(A(k,k) ~= 0.0)
      A(k+1:n,k)=-A(k+1:n,k)./A(k,k);
      for j=k+1:n
        if(A(k,j) ~= 0.0)
          for i=k+1:n
            A(i,j) = A(i,j) + A(i,k) .* A(k,j);
          end
        end
      end
    else
      sing = 1;
      return
    end
    k=k+1;
  end
  if(abs(A(n,n)) <= 1.0e-15)
    sing = 1;
  end

%*************************************************************************
%* La procedura swap scambia tra loro il valore di due variabili/vettori.*
%*************************************************************************
function [a,b]=swap(a,b) 
  temp = a;
  a = b;
  b = temp;

