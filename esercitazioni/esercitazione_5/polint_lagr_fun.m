function polint_lagr_fun(fun_name,a,b,n,tipo)
% Scelta della funzione test
f = str2func(fun_name);

% Scelta dei punti di interpolazione
if tipo == 1
    x = linspace(a, b, n);  % n+1 punti equispaziati
else
    x = chebyshev(a, b, n);  % n+1 punti secondo la distribuzione di Chebyshev
end
y = f(x);

% Punti su cui valutare l'interpolante polinomiale
m = 51;
xv = linspace(a, b, m * n + 1);
yv = lagrval2(y, x, xv);

% Valutazione della funzione test nei punti di rappresentazione grafica
yf = f(xv);

% Grafico della funzione test, dell'interpolante e dei punti
figure(1);
plot(x, y, 'ko'); hold on;
plot(xv, yv, 'r-', 'LineWidth', 2);
plot(xv, yf, 'k--', 'LineWidth', 2);
legend('Punti da interpolare', 'Interpolante polinomiale', 'Funzione');
hold off;

% Calcolo e stampa del massimo errore di interpolazione
err = abs(yf - yv);
maxerr = max(err);
fprintf('Errore interpolazione: %22.15e\n', maxerr);

% Grafico dell'errore di interpolazione
figure(2);
semilogy(xv, err, 'g-', 'LineWidth', 2);

for tipo = 1:2
    for n = 10:10:50
        if tipo == 1
            x = linspace(a, b, n);
        else
            x = chebyshev(a, b, n);
        end
        y = f(x);
        xv = linspace(a, b, m * n + 1);
        yv = lagrval2(y, x, xv);
        yf = f(xv);
        err = abs(yf - yv);
        fprintf('tipo: %i, n: %i, Errore interpolazione: %22.15e\n', tipo, n, max(err));
    end
end