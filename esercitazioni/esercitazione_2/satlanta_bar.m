%esempio per lettura di un file dati,
%grafico a barre delle temperature dei giorni di un assegnato mese ed anno

clear all
nomimesi=['gennaio  ';
          'febbraio ';
          'marzo    ';
          'aprile   ';
          'maggio   ';
          'giugno   ';
          'luglio   ';
          'agosto   ';
          'settembre';
          'ottobre  ';
          'novembre ';
          'dicembre '];
%caricamento del file dati
mt=load('ATLANTA.txt','-ascii');

anno=input('dai un anno: ');
mese=input('dai un mese: ');

[m,n]=size(mt);
i=1;
k=1;
while( k <= m )
  if (anno == mt(k,3))
      if (mese == mt(k,1))
          lista(i) = mt(k,4);
          i=i+1;
      end
  end   
  k=k+1;
end

figure(1)
hold on
title(['temperature in gradi F, anno ',int2str(anno),', mese ',nomimesi(mese,:)])
xlabel('giorni')
ylabel('temperatura')
bar_width=0.75;
bar(lista,bar_width)
