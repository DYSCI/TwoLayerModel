function [ Rs ] = RstarFun( taustar, alphastar )
    temp1 = tanh(taustar);
    temp2 = 1./alphastar;
    Rs = temp1./(temp2 + (1-temp2 ).*temp1);