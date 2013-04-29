function [x, fx, i] = rprop(x, func, m, varargin)

% Minimize a differentiable multivariate function using RPROP.
%
% Usage: [X, fX, i] = minimize(x, func, m, P1, P2, P3, ... )
% 
% x       Initial guess.
% func    The name or pointer to the function to be minimized. The function
%         func must return two arguments, the value of the function, and it's
%         partial derivatives wrt the elements of x. The partial derivative  
%         must have the same type as x.
% m       Length of the run; the maximum allowed number of function evaluations.
% P1, P2, ... parameters are passed to the function func.
%
% x       The returned solution.
% fx      Vector of function values indicating progress made.
% i       Number of iterations.

% algorithms stops if gradient norm is smaller than eps
eps_stop = 0.01;

% we allow negative m to be consistent with Rasmussen's minimize.m
m = abs(m);

% default rprop parameters
Delta0 = 0.1;
Deltamin = 1e-6;
Deltamax = 50;
eta_minus = 0.5;
eta_plus = 1.2;

% problem dimensionality
n = length(x);

% variable initializations
fx = [];
Delta = ones(n,1)*Delta0;
df_old = zeros(n,1);

% initial function evaluation
[f, df] = feval(func, x, varargin{:});
fx = [fx' f]'; 

for i=1:m
    
    % gradient sign did not change
    positive = df.*df_old > 0;
    
    % gradient sign did change
    negative = df.*df_old < 0;

    % update of step lengths
    Delta(positive) = min(Delta(positive)*eta_plus, Deltamax);
    Delta(negative) = max(Delta(negative)*eta_minus, Deltamin);

    % rprop update
    df(negative) = 0;
    Deltax = -sign(df).*Delta;
    x = x + Deltax;
    df_old = df;
    
    % function evaluation
    [f, df] = feval(func, x, varargin{:});
    fx = [fx' f]'; 

    % check gradient norm 
    if norm(df) < eps_stop, break, end
    
end

end



