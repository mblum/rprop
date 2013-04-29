
function testrprop()
    
    [x, fx, i] = rprop(2, @parabola, 100, 2, -1, 1);
    fprintf('minimum found at x=%f after %i function evaluations\n', x, i)
    plot(0:i, fx)
    title('Rprop optimization')
    xlabel('number of function evaluations')
    ylabel('objective function value')

end

function [y, g] = parabola(x, a, b, c)

    y = a*x^2 + b*x + c;
    g = 2*a*x + b;

end