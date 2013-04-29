Rprop for Matlab
================

Matlab implementation of Rprop, an efficient gradient-based optimization method.

Getting started
---------------

Add the source code to your Matlab path. You can get help by typing

        help rprop

or run the demo to find the minimum of a polynomial:

        testrprop

The Objective Function
----------------------

The objective must be given as a Matlab function of the following form:

        [y, g] = func(x, P1, P2, ...)

where y is the function value and g is the gradient wrt the parameters x. x are the parameters to be optimized and P1, P2, ... are additional parameters (optional).

