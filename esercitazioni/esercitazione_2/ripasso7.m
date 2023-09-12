%leggere il file e inserire i dati nella nostra matrice

clear all

mt=load('ATLANTA.txt','-ascii');
[m,n]=size(mt);
%m = righe
%n = colonne
fprintf('file caricato in matrice di dimensione: %d x %d\n',m,n);

mese = input('inserisci mese tra 1 e 12');
anno = input('inserisci anno tra 1995 e 2014');

lista = []; %saranno le temperature del mese e anno selezionato
i = 1; %indice della lista
k = 1; %indice che ci serve per ciclare nella matrice

while(k<=m)
    if(mt(k,3) == anno) %controllo anno
        if(mt(k,1) == mese)%controllo mese
            lista(i) = fahr2cels(mt(k,4));
            if (lista(i)==-99)
                lista(i) = NaN; 
            end
            i = i+1;
        end
    end
    k = k+1;
end

tempmassima = max(lista);
tempminima = min(lista);
tempmedia = mean(lista);

figure (1) %matlab predispone una finestra in cui mettere un graf qualsiasi
bar(lista);
title('temperature del giorno'); %titolo del grafico
xlabel('giorni');
ylabel('temperature in celsius');










