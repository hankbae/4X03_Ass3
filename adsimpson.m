function [Q, level] = adsimpson(f, a, b, tol, level, level_max)
% Computes adaptive Simpson on [a,b]
% Input
%   f function handle for which the integral is computed
%   tol tolerance
%   level level of recursion
%   level_max  max number of recursive calls
% Output
%   Q approximation of the integral of f on [a,b]. If level_max is
%   not reached, |Q-(integral of f)|<= tol
%   level level of recursion
%
% global xpoints collects the points in [a,b] selected by this
% function.

global xpoints
level = level+1;
h = b-a;
c = (a+b)/2;

%Simpson on [a,b]
fa = feval(f,a);
fb = feval(f,b);
fc = feval(f,c);
S1 = h/6*( fa + 4*fc + fb );

%Simpson on [a,c] and [c,b]
d = (a+c)/2;
e = (c+b)/2;
S2 = h/12*( fa + 4*feval(f,d) + 2*fc + 4*feval(f,e) +fb );

xpoints = unique([xpoints, a, b, c, d, e]);

error = (S2-S1)/15;

if level >= level_max 
  disp('max level reached');
  Q = S2;
else
  if abs(error) <= tol
    Q = S2 + error;
  else
    [Q1, level] = adsimpson( f, a, c, tol/2, level, level_max );
    [Q2, level] = adsimpson( f, c, b, tol/2, level, level_max );           
    Q = Q1+Q2;
  end
end