function serr_polint()
close all

f=@(x) fun5(x);
a=-1;
b=1;

i=1;
j=1;
for n=1:70
    %scelta punti di interpolazione
    x=linspace(a,b,n);
    y=f(x);
    
    %punti su cui valutare l'interpolante
    m=51;
    xv=linspace(a,b,m*n+1);
    yv=lagrval2(y,x,xv);
    
    %valori funzione test nei punti di valutazione
    yf=f(xv);
    
    %calcolo errore di interpolazione ed errore max in [a,b]
    err=abs(yf-yv);
    maxerr = max(err);
    
    if mod(n,2)==0
        maxerr_pari(i) = maxerr;
        i = i + 1;    
    else
        maxerr_dispari(j) = maxerr;
        j = j + 1;
    end
    maxerr_tutto(n)=maxerr;
end

figure(1)
semilogy(maxerr_pari, 'r*-');
hold on
semilogy(maxerr_dispari, 'bo-');    
legend('Errore massimo per n pari', 'Errore massimo per n dispari')
ylabel('Errore massimo');