% script spolint_lagr_dati.m
% Interpolante polinomiale di un set di dati: forma di Lagrange;
% viene prodotto il grafico del data set e del polinomio interpolante
clear all
close all
A=load('dataset1.dat');
[n m]=size(A);
x=A(1:n,1)';
y=A(1:n,2)';

%TO DO

