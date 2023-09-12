g = 9.81;
v0 = input('inserisci velocità iniziale ');
h = input('inserisci altezza h ');
% voglio risolvere (g/2)*t^2 - (v0)*t + h come eq di secondo grado
delta = (-v0)^2-4*(g/2)*h;
if (delta >= 0)
    t1 = (-(-v0)+ sqrt(delta))/ (2*(g/2)); %-b+radice di delta/2a
    t2 = (-(-v0)- sqrt(delta))/ (2*(g/2)); %-b-radice di delta/2a
    fprintf('t1: %f  \n',t1);
    fprintf('t2: %f  \n',t2);
    disp(delta);
end
