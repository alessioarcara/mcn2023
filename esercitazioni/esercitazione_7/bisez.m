function [xstar,n,ak,bk]=bisez(fun,a,b,tol,ftrace)
%***********************************************************
% [xstar]=sbisez(fun,a,b,tol)
% questa routine determina uno zero di una funzione con 
% il metodo di bisezione
% fun    --> nome della funzione
% a,b    --> intervallo di innesco della funzione
% tol    --> tolleranza richiesta
% xstar  <-- approssimazione dello zero
  n=1;
  if ((a<0) & (b>0) & (feval(fun,0)==0))
    xstar=0;
    ak=a;
    bk=b;
  else
   fa=feval(fun,a);
   fb=feval(fun,b);
    while (abs(b-a)>(tol+eps.*min([abs(a),abs(b)])))
     xm=a+(b-a)./2;
     fxm=feval(fun,xm);
     if (sign(fa)==sign(fxm))
       a=xm;
       fa=fxm;
     else
       b=xm;
       fb=fxm;
     end
     n=n+1;
     if (ftrace>0)
         ak(n)=a;
         bk(n)=b;
     end
    end
    xstar=a+(b-a)./2;
  end

