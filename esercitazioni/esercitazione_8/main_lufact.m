%main script iniziale da completare

fprintf('mat_k  nxn         max|l_ij|     max|u_ij|    2^(n-1)max|a_ij|\n');
nn=[5,10,50];
for n=nn
    for k=2:5

        switch k
            case 2
               A=mat_2(n);
            case 3
               A=mat_3(n);
            case 4
               A=mat_4(n);
            case 5
               A=mat_5(n);
        end
              
        %si fattorizza la matrice A
        [L,U,P]=lu(A);

        % max di una matrice genera il max di ciascuna colonna
        % max(max(...)) -> massimo di tutta la matrice
        maxl=max(max(abs(L)));

        maxu=max(max(abs(U)));
        bound=2^(n-1)*max(max(abs(A)));

        fprintf('%5d %2dx%2d  %14.5f  %14.5e  %14.5e\n',k,n,n,maxl,maxu,bound);
    end
end   