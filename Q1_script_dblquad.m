close all; clear
%Plots surface via dblquad
[X,Y] = meshgrid(2:.5:12);
Z = X;

for i = 1:length(X)
    for j = 1:length(Y)
        Z(i,j) = phi_dblquad(X(i,j),Y(i,j));
    end
end

figure(1);
surface(X,Y,Z)
view(135,30);
xlabel('x');
ylabel('y');
zlabel('\phi(x,y)');
title('dlbquad');

clear
%plots surface via simpson
[X,Y] = meshgrid(2:.5:12);
Z = phi(X,Y);
figure(2);
surface(X,Y,Z)
view(135,30);
xlabel('x');
ylabel('y');
zlabel('\phi(x,y)');
title('simpson');