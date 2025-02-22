%Inertia matrix
Ib = m*[40.07 0 -2.0923;
      0 64 0;
      -2.0923 0 99.92];

%Inverse of inertia matrix
invIb = (1/m)*[0.0249836 0 0.000523151;
              0 0.015625 0;
              0.000523151 0 0.010019];

%Form F_b (all forces in Fv) and calcualte udot, vdot, wdot
F_b = Fg_b + FE_b + FA_b;
x1to3dot = (1/m)*F_b - cross(wbe_b, V_b);

%Form Mcg_b (all moments about CoG in Fb) and calcualate pdot, qdot, rdot.
Mcg_b = MAcg_b + MEcg_b;
x4to6dot = invIb*(Mcg_b - cross(wbe_b,Ib*wbe_b));

%Calculate phidot, thetadot, and psidot
H_phi = [1 sin(x7)*tan(x8) cos(x7)*tan(x8);
        0 cos(x7) -sin(x7);
        0 sin(x7)/cos(x8) cos(x7)/cos(x8)];
x7to9dot = H_phi*wbe_b;

% Navigation Equation
C1v = [cos(x9) sin(x9) 0;
    -sin(x9) cos(x9) 0;
    0 0 1];

C21 = [cos(x8) 0 -sin(x8);
    0 1 0;
    sin(x8) 0 cos(x8)];
Cb2 = [1 0 0;
    0 cos(x7) sin(x7);
    0 -sin(x7) cos(x7)];

Cbv = Cb2*C21*C1v;
Cvb = Cbv';

x10to12dot = Cvb*V_b;

%Place in first order form
XDOT = [x1to9dot
        x10to12dot];