close all; clear
%Plots the surface of phi
[X,Y] = meshgrid(2:.5:12);
Z = phi(X,Y);
surface(X,Y,Z)
view(135,30);
xlabel('x');
ylabel('y');
zlabel('\phi(x,y)');