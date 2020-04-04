clear all
close all
clc

J_x= 27 %kg m^2
J_y= 17 %kg m^2
J_z= 25 %kg m^2
T_Orbit= 86400 %s
n=2*pi/T_Orbit % orbital Rate

B_quaternion = [zeros(4,3);diag([1/J_x 1/J_y 1/J_z])]

K_p= 3.5
K_d= 3.5
stop_time= 100 %s

for i=1:100
    r=rand;
    phi=2*pi*rand;
    theta=pi*rand;
   
Q_v_0=zeros(3,1);

Q_v_0(1,1)=r*sin(theta)*cos(phi);
Q_v_0(2,1)=r*sin(theta)*sin(phi);
Q_v_0(3,1)=r*cos(theta);
Q_4_0=sqrt(1-(Q_v_0(1,1)^2+Q_v_0(2,1)^2+Q_v_0(3,1)^2));
omega_bo_b_x_0=-0.3+(0.3+0.3)*rand;
omega_bo_b_y_0=-0.3+(0.3+0.3)*rand;
omega_bo_b_z_0=-0.3+(0.3+0.3)*rand;

x_0=[Q_v_0;
     Q_4_0;
omega_bo_b_x_0;
omega_bo_b_y_0;
omega_bo_b_z_0];

sim('nonlinear_spacecraft_quaternion_earth_ponting')
figure(1)
plot(tout,Q_v_1)
title('Q_v_1')
xlabel('time(sec)')
ylabel('Q_v_1(rad)')
grid on
hold on
figure(2)
plot(tout,Q_v_2)
title('Q_v_2')
xlabel('time(sec)')
ylabel('Q_v_2(rad)')
grid on
hold on
figure(3)
plot(tout,Q_v_3)
title('Q_v_3')
xlabel('time(sec)')
ylabel('Q_v_3(rad)')
grid on
hold on
figure(4)
plot(tout,Q_v_4)
title('Q_4')
xlabel('time(sec)')
ylabel('Q_4')
grid on
hold on
figure(5)
plot(tout,omega_bo_b_x)
title('\omega_bo_b_x')
xlabel('time(sec)')
ylabel('\omega_bo_b_x(rad/s)')
grid on
hold on
figure(6)
plot(tout,omega_bo_b_y)
title('\omega_bo_b_x')
xlabel('time(sec)')
ylabel('\omega_bo_b_y(rad/s)')
grid on
hold on
title('\omega_bo_b_y')
figure(7)
plot(tout,omega_bo_b_z)
title('\omega_bo_b_z')
xlabel('time(sec)')
ylabel('\omega_bo_b_z(rad/s)')
grid on
hold on
end





