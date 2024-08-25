clear all; clc ; close all

%% TRANSFORMACJA AKORDU C-dur NA FIGURE 3D

f1=261.63;  %Czêstotliwoœæ dŸwieku C
f2=329.63;  %Czêstotliwoœæ dŸwiêku E
f3=196;     %Czêstotliwoœæ dŸwiêku G

t=0:0.00000001:0.1;
x=sin(f1*2*pi*t);
y=sin(f2*2*pi*t);
z=sin(f3*2*pi*t);
figure(1)
plot3(x,y,z)
grid on
xlabel('x')
ylabel('y')
zlabel('z')
title('C-dur jako figura 3D')

%% TRANSFORMACJA AKORDU F-dur NA FIGURE 3D

f1=196;     %Czêstotliwoœæ dŸwieku G
f2=246.94;  %Czêstotliwoœæ dŸwiêku H
f3=293.66;  %Czêstotliwoœæ dŸwiêku D

t=0:0.00000001:0.1;
x=sin(f1*2*pi*t);
y=sin(f2*2*pi*t);
z=sin(f3*2*pi*t);
figure(2)
plot3(x,y,z)
grid on
xlabel('x')
ylabel('y')
zlabel('z')
title('F-dur jako figura 3D')

%% TRANSFORMACJA AKORDU G-dur NA FIGURE 3D

f1=220;     %Czêstotliwoœæ dŸwieku A
f2=261.63;  %Czêstotliwoœæ dŸwiêku C
f3=349.23;  %Czêstotliwoœæ dŸwiêku F

t=0:0.00000001:0.1;
x=sin(f1*2*pi*t);
y=sin(f2*2*pi*t);
z=sin(f3*2*pi*t);
figure(3)
plot3(x,y,z)
grid on
xlabel('x')
ylabel('y')
zlabel('z')
title('G-dur jako figura 3D')