function [Q] = simpson(f,a,b,n)
    format long
    h = (b-a)/(2*n);
    if n == 0;  Q = 0;
    else;       Q = (f(a)+4*f(a+h)+f(a+2*h))*h/3 + simpson(f,a+2*h,b,n-1); %using recursion
    end
end