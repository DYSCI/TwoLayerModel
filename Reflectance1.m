function [ Rdest, zeta, phi ] = Reflectance1( omegatr, A, B, n )

    zeta = zetaExact(omegatr);
    phi = real((zeta+log(1-zeta))./(zeta-log(1+zeta)));
    a = -(1+phi.^2)/2./phi;

    Rdtild = a-sqrt(a.^2-1);
    rho10tilde = DiffuseReflectivity( n );
    K = length(A)-1;
    Rd = Rdtild + (repmat(a, 1, K+1).^repmat([0:1:K], length(omegatr),1))*B';
    rho10 =  rho10tilde + (repmat(a, 1, K+1).^repmat([0:1:K], length(omegatr),1))*A';
    rho01 = ((n - 1)./(n + 1)).^2;
    Rdest = (1-rho01).*(1-rho10).*Rd ./(1-rho10.*Rd);        
