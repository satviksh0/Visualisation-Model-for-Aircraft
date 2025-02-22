%Initialize constatnts for the RCAM simulation

clear
clc
close all

%% Define constants

x0 = [85;
    0;
    0;
    0;
    0;
    0;
    0;
    0.1;
    0];

u = [0;
    -0.1;
    0;
    0; %recall minimum for throttles are 0.5*pi/180 = 0.0087
    0.08];

TF = 60;

out = sim('RCAMsimulink');
t = out.SimX.Time;

x1 = out.SimX.Data(:,1);
x2 = out.SimX.Data(:,2);
x3 = out.SimX.Data(:,3);
x4 = out.SimX.Data(:,4);
x5 = out.SimX.Data(:,5);
x6 = out.SimX.Data(:,6);
x7 = out.SimX.Data(:,7);
x8 = out.SimX.Data(:,8);
x9 = out.SimX.Data(:,9);

u1 = out.SimU.Data(:,1);
u2 = out.SimU.Data(:,2);
u3 = out.SimU.Data(:,3);
u4 = out.SimU.Data(:,4);
u5 = out.SimU.Data(:,5);

figure 
subplot(5,1,1)
plot(t, u1)
legend('u_1')
title('Aileron')
grid on

subplot(5,1,2)
plot(t, u2)
legend('u_2')
title('Elevator')
grid on

subplot(5,1,3)
plot(t, u3)
legend('u_3')
title('Rudder')
grid on

subplot(5,1,4)
plot(t, u4)
legend('u_4')
title('Throttle 1')
grid on

subplot(5,1,5)
plot(t, u5)
legend('u_5')
title('Throttle 2')
grid on

%%Plot the states
figure 

%u, v, w
subplot(3,4,1)
plot(t, x1)
legend('x_1')
title('Velocity in X-Axis')
grid on

subplot(3,4,5)
plot(t, x2)
legend('x_2')
title('Velocity in Y-Axis')
grid on

subplot(3,4,9)
plot(t, x3)
legend('x_3')
title('Velocity in Z-Axis')
grid on

%p, q, r
subplot(3,4,2)
plot(t, x4)
legend('x_4')
title('Rotation About The X-Axis')
grid on

subplot(3,4,6)
plot(t, x5)
legend('x_5')
title('Rotation About The Y-Axis')
grid on

subplot(3,4,10)
plot(t, x6)
legend('x_6')
title('Rotation About The Z-Axis')
grid on

%phi, theta, psi
subplot(3,4,3)
plot(t, x7)
legend('x_7')
title('Roll')
grid on

subplot(3,4,7)
plot(t, x8)
legend('x_8')
title('Forward Limit VS Pitch')
grid on

subplot(3,4,11)
plot(t, x9)
legend('x_9')
title('Yaw')
grid on