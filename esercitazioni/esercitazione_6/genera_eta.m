function eta=genera_eta(a,b)

% Genera un numero casuale tra a e b esclusi gli estremi
eta = a + (b-a) * rand(1, 1);

% Assicurati che il numero non sia uguale agli estremi
while eta == a || eta == b
    eta = a + (b-a) * rand(1, 1);
end