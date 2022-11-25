function toado_tdc = tinh_toadoE(theta1,theta2,d3,a1,a2)

d2r = pi/180;
toado_tdc = [a2*cosd(theta1+theta2)+a1*cosd(theta1);a2*sind(theta1+theta2)+a1*sind(theta1);-d3]';
end