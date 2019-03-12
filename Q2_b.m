close all
format long
f = @(x) exp(x)./x;
a = 1;
b = 2;

n    = zeros(length(2:10),1);
mid  = zeros(length(2:10),1);
trap = zeros(length(2:10),1);
simp = zeros(length(2:10),1);


for i = 1:length(n)
    n(i)    = 2^(i+1);
    mid(i)  = midpoint(f,a,b,n(i));
    trap(i) = trapezoid(f,a,b,n(i));
    simp(i) = simpson(f,a,b,n(i));
end

true = integral(f,a,b);

Mid_err  = abs(mid - true);
Trap_err = abs(trap - true);
Simp_err  = abs(simp - true);

loglog(1./n,Mid_err,'r');
hold on
loglog(1./n,Trap_err,'g');
loglog(1./n,Simp_err,'b');

xlabel('h');
ylabel('error');
legend('err_m','err_t','err_s');
grid on
hold off
