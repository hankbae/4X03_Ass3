f = @(x) exp(x)./x;
a = 1; b = 2;

[c,p] = findconstants(@midpoint,f,a,b);
fprintf('midpoint:\tc=%f\t\tp=%f\n',c,p);

[c,p] = findconstants(@trapezoid,f,a,b);
fprintf('trapezoid\tc=%f\t\tp=%f\n',c,p);

[c,p] = findconstants(@simpson,f,a,b);
fprintf('simpson\t\tc=%f\t\tp=%f\n',c,p);