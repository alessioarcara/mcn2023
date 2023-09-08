function I=simpson_sing(a,b,m,fa,fb,fm)
% Funzione che approssima l'integrale definito di una
% funzione mediante la formula di simpson;
% a,b  --> estremi di integrazione
% m    --> punto medio
% fa,fb --> valori della funzione integranda in a e b
% fm    --> valore della funzione integranda in m
% I    <-- approssimazione dell'integrale
% Non vengono effettuate valutazioni di funzione
%computazione
h=0.5*(b-a);
I=(fa+4*fm+fb)*h/3;
