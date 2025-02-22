clear 
clc
close all

%straight and level condition
Xdoto=[
    0
    0
    0
    0
    0
    0
    0
    0
    ];

Xo = [
    84.9905
    0
    1.2713
    0
    0
    0
    0
    0.0150
    0
    ];

Uo = [
    0
    -0.1780
    0
    0.0821
    0.0821
    ];

%Define the pertubation matrixes (i.e how much we perturb each function in 
%each direction)
dxdot_matrix = 10e-12*ones(9,9);
dx_matrix = 10e-12*ones(9,9);
du+matrix = 10e-12*ones(9,5);

[E,Ap,Bp] = ImplicitLinmod(@RCAM_model_implicit, Xdoto, Xo,Uo. dxdot_matrix, dx_matrix, du_matrix);

%calculate the A and B matrices 
A = -inv(E)*Ap;
B = -inv(E)*Bp;

A
B
