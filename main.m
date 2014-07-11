%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Two Layer Tissue Reflectance Model
%   Reference: Yudovsky, Dmitry, and Laurent Pilon. "Simple and accurate
%       expressions for diffuse reflectance of semi-infinite and two-layer
%       absorbing and scattering media." Applied Optics 48.35 (2009):
%       6670-6683.   
%   Author: Dmirty Yudovsky, DYSCI Inc., yudovsky@dysci.com
%
%   Copyright (c) 2009, Dmitry Yudovsky, DYSCI Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
% set index of refraction to your linking
n = 1.44; % 1.33, 1.00

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this script loads the two layer model parameters for the specific n
LoadForwardModel

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comparison results; comparision results for other indicies are
% unavailable
comp = load('ReflectanceN144.mat');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example for a single point
% properties of top layer
mua_1 = 1;
mus_1 = 100;
g_1 = .9;

% properties of bottom layer
mua_2 = 1;
mus_2 = 1000;
g_2 = .9;
L_1 = .01;


% Rskin = two layer reflectance
% R1 = homogenous reflectance of top layer
% R2 = homogenous reflectance of bottome layer
[ R_test, R1, R2, omega_tr_1, omega_tr_2, zeta ] = Reflectance2(     mua_1, mus_1.*(1-g_1), L_1, ...
                                            mua_2, mus_2.*(1-g_2), ...
                                            n, ...
                                            homo.A, homo.B, ...
                                            alphacoeffs);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% only do comparision plot if n = 1.44
if(n == 1.44)
    ind = comp.omega_1 > .9 & comp.omega_2 > .9;
    [R_test] = Reflectance2(        comp.mua_1(ind), comp.mus_1(ind).*(1-comp.g(ind)), comp.L_1(ind), ...
                                                comp.mua_2(ind), comp.mus_2(ind).*(1-comp.g(ind)), ...
                                                comp.n(ind), ...
                                                homo.A, homo.B, ...
                                                alphacoeffs);

    plot(R_test, comp.Rd(ind), 'k.')
    xlabel('Current model');
    ylabel('Monte Carlo simulation');
end