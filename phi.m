function f = phi(xhat,yhat)
    a = -1;
    b = 1;
    tol = 1e-5;
    func = @(x,y) 1./sqrt((xhat-x).^2+(yhat-y).^2);
    
    Y = @(y) adsimpson(@(x) func(x,y),a,b,tol,0,100);
    f = adsimpson(Y,a,b,tol,0,100);
end