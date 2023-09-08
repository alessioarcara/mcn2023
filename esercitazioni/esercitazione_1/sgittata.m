%script gittata
%dati
g=9.8;
v0=200;
n=31;
ang=linspace(0,pi/2,n);

%in alternativa
% ang=0:0.05:pi/2;
% n=length(ang);

R=v0^2/g*sin(2.*ang);

fprintf('  n      angolo    gittata\n');
fprintf('%3d %10.3f %10.3f\n',[1:n; ang; R]);