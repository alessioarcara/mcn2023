function base_plot(g,a,b)
% viene prodotto il grafico di funzioni base polinomiali
% nell'intervallo [a,b] e del grado g definito;
%input: g grado della base polinomiale
%       a,b estremi intervallo di definizione
%output: grafico della base polinomiale
%l'intervallo [a,b] viene discretizzato in m punti
close all
m=101;
x=linspace(a,b,m);

%base canonica o delle potenze
%y=powers(g,x);

%base di Bernstein
% y=bernst_def(g,x,a,b);
%y=bernst(g,x,a,b);

%punti su cui calcolare le basi di Newton 
% qx=linspace(a,b,g+1);
% qx=[0,0.4,0.5,0.7,1];
% g=length(qx)-1;

%base di Newton
%y=newton(g,qx,x);


%base con centro
% c=a;
% c=b;
c=(b-a)/2;
y=powers(g,x-c);

%grafici
figure(1)
hold on;
for i=1:g+1
    plot(x,y(:,i));
    pause
end
plot([a,b]',[0,0]','r');
