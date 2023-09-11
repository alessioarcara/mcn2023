function plot_error(fun,a,b,k)
    IE=quad(fun,a,b,10^-10);
    for i=1:k
        h=1/2^i;
        n(i)=(b-a)/h;
        
        IAt=trapezi_comp(fun,a,b,n(i),0);
        abs_err_trap(i)=abs(IE-IAt);
        
        IAs=simpson_comp(fun,a,b,n(i),0);
        abs_err_simp(i)=abs(IE-IAs);
    end
    
semilogy(n+1,abs_err_trap)
hold on;
plot(2*n+1,abs_err_simp)
legend('Trapezi', 'Simpson')
xlabel('Numero valutazioni di funzioni')
ylabel('Errore assoluto')