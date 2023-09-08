% function per  calcolare una stima di cos(x)
% con x scalare in [0,1]
% Sviluppo di Taylor di grado 4:
% cos(x) = 1 - x^2/2! + x^4/4!
function [Sum]=fcos(x)
Sum=1;
n=2;
fc2=factorial(n); 
Sum=Sum-x^2/fc2;
n=4;
fc4=factorial(n);
Sum=Sum+x^4/fc4;
end
