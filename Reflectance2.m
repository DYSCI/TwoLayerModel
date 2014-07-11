function [ Rest, R1, R2, omega_tr_1, ...
    omega_tr_2, zeta, tau, Rstar ] = Reflectance2(    mua_1, mus_tr_1, L_1, ...
                                            mua_2, mus_tr_2,...
                                            n, ...
                                            A, B, ...
                                            alphacoeffs)

    omega_tr_1 = mus_tr_1./(mua_1 + mus_tr_1);
    omega_tr_2 = mus_tr_2./(mua_2 + mus_tr_2);
    
    [ R1, zeta ] = Reflectance1( omega_tr_1, A, B, n );
    [ R2, dummy ] = Reflectance1( omega_tr_2, A, B, n );
           
    tau = zeta.*(mua_1 + mus_tr_1).*abs(L_1);
    
    alpha = polyval(alphacoeffs, omega_tr_2);
    Rstar = RStarFun(tau, alpha);
    Rest = (Rstar).*(R1 - R2) + R2;
