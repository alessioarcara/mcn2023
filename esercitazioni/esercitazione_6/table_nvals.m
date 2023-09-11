function table_nvals(fun, a, b, n)
    i = 1;
    nvals_simpson = zeros(1, n/2);
    nvals_trapezi = zeros(1, n/2);
    tols = zeros(1, n/2);

    for k = 2:2:n
        tols(i) = 10^(-k);
        m = 0.5 * (a + b);
        fa = feval(fun, a);
        fb = feval(fun, b);
        fm = feval(fun, m);
        
        % For Simpson
        s_ab_simpson = simpson_sing(a, b, m, fa, fb, fm);
        punti_simpson(1) = a;
        nval_simpson = 3;
        [~, nval_simpson, ~] = simpson_adapt(fun, a, b, m, fa, fb, fm, tols(i), s_ab_simpson, nval_simpson, punti_simpson);
        nvals_simpson(i) = nval_simpson;
        
        % For Trapezi
        s_ab_trapezi = trapezi_sing(a, b, fa, fb);
        punti_trapezi(1) = a;
        nval_trapezi = 2;
        [~, nval_trapezi, ~] = trapezi_adapt(fun, a, b, fa, fb, tols(i), s_ab_trapezi, nval_trapezi, punti_trapezi);
        nvals_trapezi(i) = nval_trapezi;

        i = i + 1;
    end

    disp(table(tols', nvals_simpson', nvals_trapezi', 'VariableNames', {'Tolerance', 'N_Values_Simpson', 'N_Values_Trapezi'}));
end