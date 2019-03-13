function [c,p] = findconstants(rule,f,a,b)
    %assume this is exact
    Q_true = integral(f,a,b);
    
    n = 5;
    h_5 = (b-a)/n;
    err_5 = Q_true - rule(f,a,b,n); % error for n = 5
    
    n = 10;
    h_10 = (b-a)/n;
    err_10 = Q_true - rule(f,a,b,n); % error for n = 10
    
    p = log(err_10/err_5)/log(h_10/h_5); % let c of each error eqn equal to each other, isolate for p
    c = err_5/(h_5^p);
end