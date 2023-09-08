%function che implementa simpson composto adattivo
function [val,nval,punti]=simpson_adapt(fun,a,b,m,fa,fb,fm,tol,s_ab,nval,punti)
% Funzione ricorsiva che approssima l'integrale definito di una
% funzione mediante metodo adattivo basato su formula trapezi composta;
% fun --> stringa contenente il nome del file in cui e'
%         presente la funzione integranda
% a,b --> estremi di integrazione
% fa,fb,fm --> valori della fun negli estremi e al centro
% tol --> tolleranza richiesta
% s_ab --> valore simpson singolo in [a,b]
% nval --> numero di valutazioni di funzioni effettuate fino ad ora
% punti --> punti calcolati fino ad ora
% val   <-- approssimazione dell'integrale
% nval  <-- aggiornamento numero valutazioni
% punti <-- aggironamento punti calcolati
mp=length(punti);
m1=0.5*(a+m);
fm1=feval(fun,m1);
m2=0.5*(m+b);
fm2=feval(fun,m2);
nval=nval+2;
s_am=simpson_sing(a,m,m1,fa,fm,fm1);
s_mb=simpson_sing(m,b,m2,fm,fb,fm2);
%fprintf('a,b,m %f %f %f tol= %e\n',a,b,m,tol);
if (abs(s_ab-s_am-s_mb)/15 < tol)
    val=(16*(s_am+s_mb)-s_ab)/15;
    punti(mp+1)=m1;
    punti(mp+2)=b;
else
    [val1,nval,punti]=simpson_adapt(fun,a,m,m1,fa,fm,fm1,0.5*tol,s_am,nval,punti);
    [val2,nval,punti]=simpson_adapt(fun,m,b,m2,fm,fb,fm2,0.5*tol,s_mb,nval,punti);
    val=val1+val2;
end
