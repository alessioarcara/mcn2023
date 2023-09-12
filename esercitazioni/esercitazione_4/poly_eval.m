function y=poly_eval(c,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function y=poly_eval(c,x)
%Algoritmo di Horner per valutazione polinomio in forma canonica
%Input:
% c : vettore dei coefficienti (da quello di potenza massima
%     a quella minima)
% x : punto o vettore in cui valutare
%Output
% y : valore o vettore valutato in x

%valutazione mediante alg. di Horner
%
%p(x)=c(n) + c(n-1)*x + ... + c(2)*x^(n-2) + c(1)*x^(n-1)
%
%    =c(n) + x*(c(n-1) + ... x*( c(3) + x*( c(2) + x*c(1) ) ) ... )
%                                                   -p-
%                                          ------ p ----
%                                ---------- p -------------

%1-mediante chiamata alla built-in function Octave/Matlab polyval()
% y=polyval(c,x);

%2-mediante implementazione esplicita
m=length(x);
n=length(c);
for i=1:m
    y(i)=c(1);
    for k=2:n
        y(i)=c(k)+x(i)*y(i);
    end
end
    
