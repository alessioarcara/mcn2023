sfile_io
%legge il file ATLANTA e lo inserisce in matrice mt
%m righe
%n colonne

%apro file di output e aggiungo intestazione
fid = fopen('file_output.txt', 'wt');
fprintf(fid,'Intestazione file \n');

lista=[]; %array dove salvo le temperature
%ciclo annidato per ogni mese di ogni anno
for anno = 1995:2014
    for mese = 1:12
        lista = []; %svuota lista
        i=1; %corrisponde al giorno
        k=1; %indice della posizione della lettura della matrice
        while(k <= m) %k indice di lettura e m numero righe
        if(mt(k,3) == anno) %nella terza colonna ci sono gli anni
            if(mt(k,1) == mese) %nella prima colonna ci sono i mesi
                lista(i) = fahr2cels(mt(k,4)); %temperatura assegnata nella lista (temporanea e cambia ogni mese)
                i = i+1; %incrementa giorno e indice della lista
            end
            
        end
        k = k+1; %scorre avanti nella matrice mt
        end
        media = mean(lista);
        massimo = max(lista);
        minimo = min(lista);
        fprintf(fid,'%d mese %d anno %f media %f max %f min\n',mese,anno,media,massimo,minimo); %stampa a file
    end
end
 
fclose(fid); %chiude