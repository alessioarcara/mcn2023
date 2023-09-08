function fun_plot(k)
%******************************************
% fun_plot(k)
% questa function rappresenta graficamente 
% la funzione test zfunfk; se sono presenti
% le funzioni zfunpk e zfunppk rappresenta
% anche le funzioni g(x) e g'(x)
%******************************************
close all
if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
  funpstr=['zfunp0',num2str(k,'%d')];
  funppstr=['zfunpp0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
  funpstr=['zfunp',num2str(k,'%d')];
  funppstr=['zfunpp',num2str(k,'%d')];
end
%funzione test
fun=str2func(funstr);
info=functions(fun);

%derivata prima funzione test
funp=str2func(funpstr);
infop=functions(funp);

%derivata seconda funzione test
funpp=str2func(funppstr);
infopp=functions(funpp);

%funzione y=x
fx=str2func('funx');

if(length(info.file)~=0)
%intervallo di definizione della funzione test
 ab=fun();
 xa=ab(1);
 xb=ab(2);

 n=400;
 x=linspace(xa,xb,n);

 if(length(infop.file)~=0 & length(infopp.file)~=0)
%plot di f(x), x, g(x) e g'(x)
   for i=1:n
     f(i)=feval(fx,x(i));
     y(i)=feval(fun,x(i));
     yp(i)=feval(funp,x(i));
     ypp(i)=feval(funpp,x(i));
     g(i)=x(i)-y(i)/yp(i);
     gp(i)=y(i)*ypp(i)/yp(i)^2;
   end
   figure(1);
   title('plot di f(x), x, g(x) e g''(x)');
   hold on
   plot(x,y,'b-','LineWidth',1.5);
   plot(x,f,'k-','LineWidth',1.5);
   plot(x,g,'r-','LineWidth',1.5);
   plot(x,gp,'g-','LineWidth',1.5);
   
   
   axis([xa,xb,-3.5,3.5]);
   plot([xa,xb],[-1,-1],'c--','LineWidth',1.5);
   plot([xa,xb],[0,0],'k--','LineWidth',1.5);
   plot([xa,xb],[1,1],'m--','LineWidth',1.5);
   legend('  f(x)','     x','  g(x)',' g''(x)','   -1','    0','  +1');
 else
%solo plot di f(x)
   for i=1:n
    y(i)=feval(fun,x(i));
   end
   figure(1);
   title('plot di f(x)');
   hold on
   plot(x,y,'b-','LineWidth',1.5);
   plot([xa,xb],[0,0],'k--','LineWidth',1.5);
   legend('  f(x)','    0');
 end
else
 fprintf('Errore: la funzione test %s non esiste\n',funstr);
end

end
