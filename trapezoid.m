function [Q] = trapezoid(f,a,b,n)
    format long
    h = (b-a)/n;
    if n == 0;  Q = 0;
    else;       Q = (f(a)+f(a+h)).*h./2 + trapezoid(f,a+h,b,n-1); %using recursion
    end
end