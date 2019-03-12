clear all;
f = @(x) exp(-x.^2)*2/sqrt(pi);
a = 0; b = 1;
err = inf;
n = -1;
while err >= 10^(-10)
    if err >=1.1e-10; n = n+1000;
    elseif err >=1.02e-10; n = n+500;
    else; n = n + 1;
    end
    Q = midpoint(f,a,b,n);
    err = abs(Q-erf(1));
end
n
Q_test = midpoint(f,a,b,n);
err_test = abs(Q_test-erf(1))



