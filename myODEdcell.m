function [dxdt] = myODEdcell(tspan,x0,S,cell)
    
%Parameters
ax = 15e-2;
ay = 2.7e-2;
Bx = 5.9;
By = 5.4;
dy = 1.07;
zx = 6.4e-5;
nzx = 2.34;
xz = 12e-2;
nxz = 2;
dz = 1.12;
yz = 11e-3;
xy = 8.3e-4;
nyz = 2;
nxy = 2;

if tspan >= 600
    S = 100;
end

dxdt = zeros(2,1);

dxdt(1) = (ax+Bx*S)/(1+S+(x0(3)/zx)^nzx) - x0(1);

dxdt(2) = (ay+By*S)/(1+S+(x0(1)/xy)^nxy) - dy*x0(2);

dxdt(3) = 1/(1+(x0(1)/xz)^nxz+(x0(2)/yz)^nyz) - dz*x0(3);
end