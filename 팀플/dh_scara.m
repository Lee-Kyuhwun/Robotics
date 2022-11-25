function [theta1,theta2,d3] = dh_scara(x,y,z,a1,a2)

r2d = 180/pi;
d3 = -z;
theta2 = -acos((x^2+y^2 - a1^2 -a2^2)/(2*a1*a2));
cg = [(cos(theta2) * a2 * x + a2 * sin(theta2) * y + a1 * x) / (a1 ^ 2 + 0.2e1 * a1 * a2 * cos(theta2) + a2 ^ 2); (cos(theta2) * a2 * y - a2 * sin(theta2) * x + a1 * y) / (a1 ^ 2 + 0.2e1 * a1 * a2 * cos(theta2) + a2 ^ 2)];
theta1 = atan2(cg(2),cg(1));

theta2 = theta2*r2d;
theta1 = theta1*r2d;
end
