%Function fidiff.m
%****************************************************
%approssimazione della derivata della funzione exp(x)
%mediante rapporto incrementale al diminuire di h
%****************************************************
function fidiff(x)
if nargin<1
    x=1; 
end
fp = exp(x); % valore esatto della derivata

n=15;
% punti equispaziati tra 10^x1:-14 e 10^x2:0
h = logspace(-(n-1),0,n)'; % vettore colonna dei passi
fprintf(' h            fp           fpfd     AErr      RErr\n');
% dall'h più grande
for k=n:-1:1
  fpfd = (exp(x+h(k)) - exp(x))/h(k); % derivative computation
  AErr(k) = abs(fpfd - fp); % absolute error
  RErr(k) = abs((fpfd - fp)/fp); % relative error
  fprintf('%8.1e %12.5f %12.5f %9.2e %9.2e\n',h(k),fp,fpfd,AErr(k),RErr(k));
end

%grafico del Relative Error in scala logaritmica
%per farci vedere come variano gli ordini di grandezza
loglog(h,RErr,'o-','LineWidth',1.5); 
xlabel('Stepsize h'); 
ylabel('Relative error');
