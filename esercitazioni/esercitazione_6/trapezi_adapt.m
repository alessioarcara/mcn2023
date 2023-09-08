%function che implementa trapezi composto adattivo
function [val,nval,punti]=trapezi_adapt(fun,a,b,fa,fb,tol,t_ab,nval,punti)
% Funzione ricorsiva che approssima l'integrale definito di una
% funzione mediante metodo adattivo basato su formula trapezi composta;
% fun --> stringa contenente il nome del file in cui e'
%         presente la funzione integranda
% a,b --> estremi di integrazione
% fa,fb --> valori della fun negli estremi
% tol --> tolleranza richiesta
% t_ab --> valore trapezi singolo in [a,b]
% nval --> numero di valutazioni di funzioni effettuate fino ad ora
% punti --> punti calcolati fino ad ora
% val   <-- approssimazione dell'integrale
% nval  <-- aggiornamento numero valutazioni
% punti <-- aggironamento punti calcolati

mp=length(punti);
m=0.5*(a+b);
fm=feval(fun,m);
nval=nval+1;
t_am=trapezi_sing(a,m,fa,fm);
t_mb=trapezi_sing(m,b,fm,fb);
%fprintf('a,b,m %f %f %f tol= %e\n',a,b,m,tol);
if (abs(t_ab-t_am-t_mb)/3 < tol)
    val=(4*(t_am+t_mb)-t_ab)/3;
    punti(mp+1)=b;
else
    [val1,nval,punti]=trapezi_adapt(fun,a,m,fa,fm,0.5*tol,t_am,nval,punti);
    [val2,nval,punti]=trapezi_adapt(fun,m,b,fm,fb,0.5*tol,t_mb,nval,punti);
    val=val1+val2;
end
