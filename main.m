% Finite Difference Methods
% Sturm - Liouville problems
% To solve for u
% Consider : -(p u')' + q u = f in (a,b)
%              u(a) = alpha
%              u(b) = beta

close all;
clear all;
clc;

type = 1;
prob = probSet(type);

soln = solFinite();
soln = soln.computeSol(prob);

soln = soln.solve(prob);