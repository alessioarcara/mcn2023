%script di innesco per simpson_adapt
function main_simpson_adapt(fun,a,b,tol)
close all
tol1=1.0e-12;
I=quad(fun,a,b,tol1);
fprintf('valore I= %14.7e\n',I);

m=100;
x=linspace(a,b,m);
y=feval(fun,x);
figure(1)
hold on
plot(x,y,'LineWidth',1.5);

%parametri da passare alla simpson_adapt
m=0.5*(a+b);
fa=feval(fun,a);
fb=feval(fun,b);
fm=feval(fun,m);
s_ab=simpson_sing(a,b,m,fa,fb,fm);
punti(1)=a;
nval=3;
[val,nval,punti]=simpson_adapt(fun,a,b,m,fa,fb,fm,tol,s_ab,nval,punti);
plot(punti,0,'k+','LineWidth',1.5);
fprintf('Valore integrale = %22.15e\n',val);
fprintf('AbsError = %14.7e\n',abs(val-I));
fprintf('Numero valutazioni = %d\n',nval);
fprintf('Numero di intervalli = %d\n',length(punti)-1)