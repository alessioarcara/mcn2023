function [y,y1]=poly_eval_der(c,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function [y,y1]=poly_eval_der(c,x)
%Algoritmo di Ruffini per valutazione polinomio in forma canonica e sua
%derivata prima
%Input:
% c : vettore dei coefficienti (da quello di potenza massima a quella
%     minima)
% x : punto o vettore in cui valutare
%Output
% y  : valore o vettore valutato in x del polinomio
% y1 : valore o vettore valutato in x della derivata prima

%Algoritmo di Ruffini per valore e derivata prima di un polinomio
n=length(c);
m=length(x);
%Ciclo sui punti di valutazione
for i = 1:m
    y(i) = c(1);
    y1(i) = 0;
    for k = 2:n
        y1(i) = y(i) + x(i) * y1(i);
        y(i) = c(k) + x(i) * y(i);
    end
end
