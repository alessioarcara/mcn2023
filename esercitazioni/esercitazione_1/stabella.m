x = linspace(0.00, 2*pi,200);
n = length(x);

seno = sin(x);
coseno = cos(x);
somma = sin(x).^2+ cos(x).^2; %per qualsiasi valore fa sempre 1

fprintf('%3d %10.3f %10.3f %10.3f %10.3f \n ', [1:n; x; seno ; coseno ; somma]);
minx = min(coseno)


