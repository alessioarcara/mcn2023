%esempio per lettura di un file dati 

clear all
%caricamento del file dati
mt=load('ATLANTA.txt','-ascii');

[m,n]=size(mt);
fprintf('file caricato in matrice di dimensione: %d %d\n',m,n);

%k=1000;
%fprintf('%3d %3d %5d %10.4f \n',mt(k,1),mt(k,2),mt(k,3),mt(k,4));

% fid = fopen('file_output.txt', 'wt');
% fprintf(fid,'Intestazione file \n');     
% fprintf(fid,'%3d %3d %5d %10.4f \n',mt(k,1),mt(k,2),mt(k,3),mt(k,4));
% 
% fclose(fid);