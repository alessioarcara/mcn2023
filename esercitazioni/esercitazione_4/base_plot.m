function base_plot(g,a,b)
% viene prodotto il grafico di funzioni base polinomiali
% di grado g nell'intervallo [a,b];
% input: g grado della base polinomiale
%        a,b estremi intervallo di definizione
% output: grafico della base polinomiale
%
% Il grafico viene realizzato su una discretizzazione 
% di m punti dell'intervallo [a,b]

close all
m=201;
x=linspace(a,b,m);

%base canonica o delle potenze
% y=powers(g,x);

%base di Bernstein
% y=bernst_def(g,x,a,b);

% y=bernst(g,x,a,b);

% t=(x-a)./(b-a);
% y=bernst01(g,t);

% %base con centro
c=a;
y=powers(g,x-c);

%grafici
figure(1)
hold on;
plot(x,y,'LineWidth',2);
plot([a,b]',[0,0]','r');

