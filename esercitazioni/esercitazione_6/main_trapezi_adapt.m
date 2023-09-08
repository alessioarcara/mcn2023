%script di innesco per trapezi_adapt
function main_trapezi_adapt(fun,a,b,tol)
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

%parametri da passare alla trapezi_adapt
fa=feval(fun,a);
fb=feval(fun,b);
t_ab=trapezi_sing(a,b,fa,fb);
punti(1)=a;
nval=2;
[val,nval,punti]=trapezi_adapt(fun,a,b,fa,fb,tol,t_ab,nval,punti);

plot(punti,0,'r+','LineWidth',1.5);
fprintf('Valore integrale = %22.15e\n',val);
fprintf('AbsError = %14.7e\n',abs(val-I));
fprintf('Numero di valutazioni = %d\n',nval);
fprintf('Numero di intervalli = %d\n',length(punti)-1);