sfile_io
%legge il file ATLANTA e lo inserisce in matrice mt
%m righe
%n colonne

mese = input('Inserisci mese: ');

lista=[]; %array dove salvo le temperature
lista_max=[]; %conterrà le temperature massime
lista_min=[]; %conterrà le temperature minime
%ciclo annidato per ogni anno
for anno = 1995:2014
    i=1; %corrisponde al giorno
    k=1; %indice della posizione della lettura della matrice
    while(k <= m) %k indice di lettura e m numero righe
    if(mt(k,3) == anno) %nella terza colonna ci sono gli anni
        if(mt(k,1) == mese) %nella prima colonna ci sono i mesi
            lista(i) = fahr2cels(mt(k,4)); %temperatura assegnata nella lista (temporanea e cambia ogni anno)
            i = i+1; %incrementa giorno e indice della lista
        end

    end
    k = k+1; %scorre avanti nella matrice mt
    end
    massimo = max(lista); %calcola massimo della lista
    minimo = min(lista); %calcola minimo della lista
    
    lista_max(end+1) = massimo; %aggiungi alla lista il massimo
    lista_min(end+1) = minimo; %aggiungi alla lista il minimo
    
    %fprintf('%d mese / %d anno / %f max / %f min\n',mese,anno,massimo,minimo); %stampa
    
end

%grafico a barre dei massimi
figure(1)
hold on; %conserva il grafico corrente quando aggiungo nuovi grafici
title('Massimi')
xlabel('Anno')
ylabel('Temperatura')
bar(lista_max, 'r'); %crea il grafico di colore r=red

%grafico a barre dei minimi
figure(2)
hold on;
title('Minimi')
xlabel('Anno')
ylabel('Temperatura')
bar(lista_min, 'g'); %crea il grafico di colore g=green
