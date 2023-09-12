%sa3
A = [2,6,-4,12;-5,-9,10,2;-6,12,8,16;15,-3,12,2];
%a
v2 = A(2,:);
%b
v2 = v2./(A(:,1)');%vettore riga diviso vettore colonna trasposto (vettor riga)
disp(v2)
%c
B = A([1:4],[2:4]);
disp(B)
C = A([1:2],[2:4]);
disp(C)
At = A';
disp(At)
%f
c1 = (A[:,1]);




