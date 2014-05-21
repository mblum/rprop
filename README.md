# Rprop 

Rprop implementation in Octave/MATLAB for efficient gradient-based optimization.

* M. Riedmiller, H. Braun (1992) Rprop: A Fast Adaptive Learning Algorithm. In International Symposium on Computer and Information Science VII. pp. 279 - 286. Antalya, Turkey.

Getting started
---------------

Add the source code to your Matlab path. You can get help by typing

    help rprop

or run the demo to find the minimum of a polynomial:

    testrprop

The objective function
----------------------

The objective must be given as a Matlab function of the following form:

    [y, g] = func(x, P1, P2, ...)

where y is the function value and g is the gradient wrt the parameters x. x are the parameters to be optimized and P1, P2, ... are additional parameters (optional).

