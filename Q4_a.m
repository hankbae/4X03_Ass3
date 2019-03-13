clear all
format long
% -----------------------------PROBLEM 4 (a)-----------------------------
% ------------file reading---------
file = fopen('nbody.dat','r');
in = fscanf(file,'%f   %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f  \n',[16 inf]);
fclose(file);
in = in';
t = in(:,1);


% ---------least square --------------
coeff = zeros(5,5);
m = length(in)-1;
x = zeros(m+1,5);
y = zeros(m+1,5);
names = ['Jupiter';'Saturn ';'Uranus ';'Neptune';'Pluto  '];
for i = 1:5
    x(:,i) = in(:,3*i-1);
    y(:,i) = in(:,3*i);
    F = sum(y(:,i));
    G = sum(y(:,i).^2);
    H = sum(y(:,i).^3);
    I = sum(y(:,i).^4);
    J = sum(x(:,i));
    K = sum(x(:,i).^2);
    L = sum(x(:,i).^3);
    M = sum(x(:,i).*y(:,i));
    N = sum(x(:,i).*y(:,i).^2);
    O = sum(x(:,i).*y(:,i).^3);
    P = sum(x(:,i).^2.*y(:,i));
    Q = sum(x(:,i).^2.*y(:,i).^2);
    R = sum(x(:,i).^3.*y(:,i));
    A = [I O N H G; O Q P N M; N P K M J; H N M G F; G M J F m+1];
    B = [Q R L P K]';
    coeff(:,i) = A\B;
    fprintf('%s\n',names(i,:));
    fprintf('a=%f\nb=%f\nc=%f\nd=%f\ne=%f\n',coeff(1,i),coeff(2,i),coeff(3,i),coeff(4,i),coeff(5,i));
end

% -----------------------------PROBLEM 4 (b)-----------------------------
hold on
for planet = 1:5
    a = coeff(1,planet);
    b = coeff(2,planet);
    c = coeff(3,planet);
    d = coeff(4,planet);
    e = coeff(5,planet);
    t = in(:,1);
    X = x(:,planet);
    Y = y(:,planet);
    
    planet_x = interp1q(t,X,500);
    planet_y = interp1q(t,Y,500);
    plot(planet_x,planet_y,'*r');
    [xs,ys] = meshgrid(min(X)-1:0.1:max(X)+1,min(Y)-1:0.1:max(Y)+1);
    contour(xs, ys, a*ys.^2+b*xs.*ys+c*xs+d*ys+e-xs.^2, [0, 0], 'k-');
    
end
hold off


