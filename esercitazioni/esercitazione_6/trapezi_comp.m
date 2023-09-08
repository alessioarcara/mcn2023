function I=trapezi_comp(fun,a,b,n,fp)
% Funzione che approssima l'integrale definito di una
% funzione mediante la formula dei trapezi composta;
% fun --> stringa contenente il nome del file in cui e'
%         presente la funzione integranda
% a,b --> estremi di integrazione
% n   --> numero di sottointervalli
% fp  --> 0 no visualizzazione grafica
%         1 visualizzazione funzione e interpolazione a tratti
% I   <-- approssimazione dell'integrale
% Vengono effettuate n+1 valutazioni di funzione

%codice per formula trapezi composta
h=(b-a)/n;
x=linspace(a,b,n+1);
y=feval(fun,x);
I=h*(0.5*(y(1)+y(n+1))+sum(y(2:n)));

%visualizzazione grafica
if (fp>0)
     figure(1)
     title('Trapezi Composto');
     hold on;
    %grafico funzione integranda
     xv=linspace(a,b,200);
     yv=feval(fun,xv);
     plot(xv,yv,'b-');
    %grafico valutazioni trapezi composta
     y=feval(fun,x);
     plot(x,y,'r-+');
     plot([a,b],[0,0],'k');
    %piecewise linear interpolation
     for i=1:n+1
      plot([x(i),x(i)],[0,y(i)],'r-');
     end
end

end
