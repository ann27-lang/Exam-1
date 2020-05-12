function [dxdt] = myODE(tspan,x0,S)

%Parameters
ax = 1.5;
Bx = 5;
zx = 0.4;
nzx = 2.7;
xz = 1.5;
nxz = 2.7;
dz = 1;

dxdt = zeros(2,1);

dxdt(1) = (ax+Bx*S)/(1+S+(x0(2)/zx)^nzx) - x0(1);

dxdt(2) = 1/(1+(x0(1)/xz)^nxz) - dz*x0(2);


end