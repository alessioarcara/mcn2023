%apro il file e carico tutto in mt
sfile_io
    %mt = il file in matrice
    %m = righe
    %n = colonne
%chiedere in input mese e anno
mt
mese = input('inserisci mese');
anno = input('inserisci anno fra 1995 e 2014');

%estrarre i valori in quel mese e in quell'anno
i=1; 
k=1;
lista=[]; %array dove salvo le temperature
while(k<=m)
    if(mt(k,3)==anno) %perchè nella terza colonna ci sono gli anni
        if(mt(k,1)==mese) %perchè nella prima colonna ci sono i mesi
            lista(i) = fahr2cels(mt(k,4));
            i = i+1;
        end
    end
    k = k+1;
end

disp(lista);
%calcola minima massima e media
tempmin = min(lista);
tempmax = max(lista);
tempmedia = mean(lista);

fprintf('la temperatura massima e %f\n',tempmax);
fprintf('la temperatura minima e %f\n',tempmin);
fprintf('la temperatura media e %f\n',tempmedia);
