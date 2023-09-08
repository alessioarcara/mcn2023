function [xstar]=bisez(fun,a,b,tol)
%***********************************************************
% [xstar]=sbisez(fun,a,b,tol)
% questa routine determina uno zero di una funzione con 
% il metodo di bisezione
% fun    --> nome della funzione
% a,b    --> intervallo di innesco della funzione
% tol    --> tolleranza richiesta
% xstar  <-- approssimazione dello zero
  if ((a<0) & (b>0) & (feval(fun,0)==0))
    xstar=0;
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
    end
    xstar=a+(b-a)./2;
  end

