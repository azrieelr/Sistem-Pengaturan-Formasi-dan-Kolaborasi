Df = [-1 0 0;0 -1 0;0 0 -1];
Di = [1 1 1];

Af = Df*Df';
Ai = Di*Di';
Bf = Df*Di';

Lg = [Af Bf;Bf' Ai];

xf(1:3,1) = [0.1;0.5;0.2];
%====
%UPDATE

for k = 1:10
xf(1:3,k+1) = -Af*xf(1:3,k)-Bf*5;
end

%====
%PLOT

plot(xf(1,:));
hold on
plot(xf(2,:));
plot(xf(3,:));
legend('x1','x2','x3');