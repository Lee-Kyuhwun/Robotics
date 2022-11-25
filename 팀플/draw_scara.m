function draw_scara(theta1,theta2,d3,a1,a2,l3)

goc = [0 0 0]';
goc0 = [0 0 -1000]';
d2r = pi/180;
theta1 = theta1*d2r;
theta2 = theta2*d2r;
vt1 = [a1*cos(theta1);a1*sin(theta1);0];
vt2 = [a2*cos(theta1+theta2)+a1*cos(theta1);a2*sin(theta1+theta2)+a1*sin(theta1);0];
d = [0;0;-d3];
dt = [0;0;l3-d3];
draw_line(goc0,goc,2,[1,0,0]);
draw_line(goc,vt1,2,[1,0,0]);
draw_line(vt1,vt2,2,[1,0,0]);
draw_line(vt2,vt2+d,2,[1,0,0]);
draw_line(vt2,vt2+dt,2,[1,0,0]);


plot3(goc0(1),goc0(2),goc0(3),'rh');
plot3(vt2(1)+dt(1),vt2(2)+dt(2),vt2(3)+d(3),'bo',"LineWidth",20);
plot3(goc(1),goc(2),goc(3),'ro');
plot3(vt1(1),vt1(2),vt1(3),'ro');
plot3(vt2(1),vt2(2),vt2(3),'rs');

end
function draw_line(p1, p2, lw, clr)
line([p1(1,1),p2(1,1)],[p1(2,1),p2(2,1)],[p1(3,1),p2(3,1)],'LineWidth',lw,'Color',clr);
end