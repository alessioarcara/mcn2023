function I=trapezi_sing(a,b,fa,fb)
% Funzione che approssima l'integrale definito di una
% funzione mediante la formula dei trapezi;
% a,b  --> estremi di integrazione
% fa,fb --> valori della funzione integranda in a e b
% I    <-- approssimazione dell'integrale
% Non vengono effettuate valutazioni di funzione
%computazione
h=b-a;
I=0.5*h*(fa+fb);
