function scompound(x)
    n_vect = [50, 100, 1000, 10000, 100000, 1000000];
    alg1_results = zeros(1, length(n_vect));
    alg2_results = zeros(1, length(n_vect));
    alg3_results = zeros(1, length(n_vect));
    alg4_results = zeros(1, length(n_vect));
    alg5_results = zeros(1, length(n_vect));

    for i = 1:length(n_vect)
        [alg1, alg2, alg3, alg4, alg5] = compound(x, n_vect(i));
        alg1_results(i) = alg1;
        alg2_results(i) = alg2;
        alg3_results(i) = alg3;
        alg4_results(i) = alg4;
        alg5_results(i) = alg5;
    end

    T = table(n_vect', alg1_results', alg2_results', alg3_results', alg4_results', alg5_results', ...
        'VariableNames', {'n_vect', 'alg1', 'alg2', 'alg3', 'alg4', 'alg5'});
    disp(T);
end