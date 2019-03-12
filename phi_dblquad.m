function f = phi_dblquad(xhat,yhat)
    F = @(x,y) 1./sqrt((xhat-x).^2+(yhat-y).^2);
    f = dblquad(F,-1,1,-1,1);
end