figure
cla
hold on
axis([-1500 1500 -1500 1500 -1000 1000]);
view(20,25); axis square;
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
%Ve thu robot
cd_a1 = 900;
cd_a2 = 600;
cd_d3 = 750;


p0 = [1500,0,-(cd_d3-50)];
p1 = [1500,0,-350];
p2 = [800,-1000,-50];
p3 = [800,-1000,-50];
p4 = [800,-1000,-50];
p5 = [-500,-500,-50];
p6 = [-500,-500,300];

draw_scara(0,0,cd_d3-50,cd_a1,cd_a2,cd_d3);
%plot3(1500,0,-(cd_d3-50),'b*')
%text(1500,0,-(cd_d3-50),'Zero point P0','Color','magenta')
%plot3(1500,0,-50,'b*')
%text(1500,0,-50,'P1','Color','magenta')
%plot3(-1250,0,-50,'b*')
%text(-1250,0,-50,'P2,P4','Color','magenta')
%plot3(-1250,0,-200,'b*')
%text(-1250,0,-200,'P3','Color','magenta')
%plot3(1250,500,-50,'b*')
%text(1250,500,-50,'P5','Color','magenta')
%plot3(1250,500,-700,'b*')
%text(1250,500,-700,'P6','Color','magenta')

[qd,vt] = taoquydao_b3([p0;p1;p2;p3;p4;p5;p6],[3,2,2,2,2,2],0.05,cd_a1,cd_a2);


len = length(qd(1,:));
diem_tdc = zeros(len,3);
for i = 1:len
    diem_tdc(i,1:3) = tinh_toadoE(qd(1,i),qd(2,i),qd(3,i),cd_a1,cd_a2);
end

ve = input('Simulation ?   ');
vedt = input('Graph Drawing ?  ');
if ve == 1
co = 0;
for i = 1:len
    draw_scara(qd(1,i),qd(2,i),qd(3,i),cd_a1,cd_a2,cd_d3);
    plot3(diem_tdc(1:i,1),diem_tdc(1:i,2),diem_tdc(1:i,3),'b','LineWidth',1);
    %vebt([-1500,-300,-1000],1500,500,600)    
%     plot3(1500,0,-(cd_d3-50),'b*')
%     text(1500,0,-(cd_d3-50),'Zero point P0','Color','magenta')
%     plot3(1500,0,-50,'b*')
%     text(1500,0,-50,'P1','Color','magenta')
%     plot3(-1250,0,-50,'b*')
%     text(-1250,0,-50,'P2,P4','Color','magenta')
%     plot3(-1250,0,-200,'b*')
%     text(-1250,0,-200,'P3','Color','magenta')
%     plot3(1250,500,-50,'b*')
%     text(1250,500,-50,'P5','Color','magenta')
%     plot3(1250,500,-700,'b*')
%     text(1250,500,-700,'P6','Color','magenta')


    
    if diem_tdc(i,1) == -1250 && abs(diem_tdc(i,2) ) <= 1e-6 && diem_tdc(i,3) == -200
        co = 1;     
    end
    
%     if co == 0 
%         vevat([-1250,0,-400],150,200);
%     elseif co == 1
%         vevat([diem_tdc(i,1),diem_tdc(i,2),diem_tdc(i,3)-200],150,200);
%     end
    
    pause(0.01);
    if i == len
    else
        cla
    end
end
msgbox('Simulation finished!');
end
    if vedt == 1
    figure 
    subplot(1,2,1);
     plot((1:len)*0.01,qd(1,:),'LineWidth',1.5);
     title('${\theta_1}(deg)$','interpreter','latex');
     grid on;
 
     subplot(1,2,2);
     plot((1:len)*0.01,vt(1,:),'LineWidth',1.5);
      title('$\dot{\theta_1}(deg/s)$','interpreter','latex');
      grid on;
      
%       figure 
%       subplot(1,2,1);
%      plot((1:len)*0.01,qd(2,:),'LineWidth',1.5);
%      draw_trajectory_1vebt
%      title('${\theta_2}(deg)$','interpreter','latex');     grid on;
%       subplot(1,2,2);
%      plot((1:len)*0.01,vt(2,:),'LineWidth',1.5);
%      title('$\dot{\theta_2}(deg/s)$','interpreter','latex');
%      grid on;
     
     figure 
     subplot(1,2,1);
    plot((1:len)*0.01,qd(3,:),'LineWidth',1.5);
     title('${d_3}(mm)$','interpreter','latex');
     grid on;
 
     subplot(1,2,2);
     plot((1:len)*0.01,vt(3,:),'LineWidth',1.5);
     title('$\dot{d_3}(mm/s)$','interpreter','latex');%
     grid on;
     end
