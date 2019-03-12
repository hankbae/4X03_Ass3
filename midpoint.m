function [Q] = midpoint(f,a,b,n)
    format long
    h = (b-a)/n;
    if n == 0;  Q = 0;
    else;       Q = f(a+h/2)*h + midpoint(f,a+h,b,n-1); %using recursion
    end
end
