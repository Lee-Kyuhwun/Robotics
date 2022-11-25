function vevat(tam,bk,cao)

    phi = 0:30:360;
    phi = phi*pi/180;
    diem = zeros(length(phi),1);
    diem(:,3) = tam(3); 
    j = 1;
    for i = phi

        diem(j,1) = tam(1) + bk*cos(i);
        diem(j,2) = tam(2) + bk*sin(i);
        j = j+1;
    end
    
    diem2 = diem;
    diem2(:,3) = tam(3) + cao;

    len = length(phi);

  
    lw = 1;
    clr = [0 0 0];
    for i = 1:len
        if i == len
            draw_line(diem(i,:)',diem(1,:)',lw,clr);
            draw_line(diem2(i,:)',diem2(1,:)',lw,clr);
        else
            draw_line(diem(i,:)',diem(i+1,:)',lw,clr);
            draw_line(diem2(i,:)',diem2(i+1,:)',lw,clr);
        end
        draw_line([diem2(i,1);diem2(i,2);diem2(1,3)],[diem(i,1);diem(i,2);diem(1,3)],lw,clr)
    end
    
    
end
function draw_line(p1, p2, lw, clr)
line([p1(1,1),p2(1,1)],[p1(2,1),p2(2,1)],[p1(3,1),p2(3,1)],'LineWidth',lw,'Color',clr);
end