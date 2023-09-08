%Script scompute_u.m
%**************************************************
%gestisce sia il caso BASIC single che BASIC double
%flag=0 per BASIC single
%flag=1 per BASIC double
%**************************************************

%cambiare il flag
flag=1;

if (flag==0)
%******************************************
%calcolo dell'unita' di arrotondamento via
%caratterizzazione o def. operativa per
%BASIC single precision
%F(2,24,-127,128)
%BASIC SingleU =0.5* 2^(1-24)
%(1 + SingleU) == 1
%******************************************
    %stampa di u
    u =2^(-24);
    fprintf('u = 2^(-24) = %20.16e \n',u);

    %Applichiamo definizione operativa
    u=single(1);
    t=0;
    while(1+u > 1)
        u=u/2;
        t=t+1;
    end
    
    if (u+1) == 1
        fprintf('Largest Finite and Positive Number u such that u+1==1\n');
        fprintf('%13.8e\n',u);
        fprintf('Exponent -%d\n',t);
    end
end

if (flag==1)
%******************************************
%calcolo dell'unita' di arrotondamento via
%caratterizzazione o def. operativa per 
%BASIC double precision
%F(2,53,-1023,1024)
%BASIC DoubleU =0.5* 2^(1-53)
%(1 + DoubleU) == 1
%******************************************
    %stampa di u
    u = 2^(-53);
    fprintf('u = 2^(-53) = %20.15e \n',u);  	

    %Applichiamo definizione operativa
    u=1;
    t=0;
    while(1+u > 1)
        u=u/2;
        t=t+1;
    end

    if (u+1) == 1 
        fprintf('Largest Finite and Positive Number u such that u+1==1\n');
        fprintf('%20.15e\n',u);
        fprintf('Exponent -%d\n',t);
    end
end