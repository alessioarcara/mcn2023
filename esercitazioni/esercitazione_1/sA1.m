%esercizio A1
%definizione della matrice A
A=[1 2 3 4;
   3 4 5 6;
   5 6 7 8;
   7 8 9 0];

%copia di A in B
B=A;

%copia della prima riga di A in un vettore a1
a1=A(1,:);

%sostituire la prima riga di A con l'ultima
A(1,:)=A(4,:); % anche A(1,:)=A(end,:);

%copiare il vettore a1 nell'ultima riga di A
A(4,:)=a1; % anche A(end,:)=a1;

%definire P come la matrice identita' con prima ed ultima riga scambiate
P=[0 0 0 1; 0 1 0 0; 0 0 1 0; 1 0 0 0];

%in alternativa
% P=eye(4);
% P=[P(4,:);P(2,:);P(3,:);P(1,:)];
% disp(P)

%prodotto di P per B
C=P*B;

%confronto di A con C
disp(A);
disp(C);