function vebt(diemdat,dai,rong,cao)

    dd = [diemdat(1);diemdat(2);diemdat(3)+cao];
    r = [diemdat(1) + rong;diemdat(2);diemdat(3)+cao];
    d1 = [diemdat(1);diemdat(2) + dai;diemdat(3)+cao];
    d2 = [r(1);r(2) + dai;r(3)];
    c1 = [dd(1) ;dd(2);dd(3) - cao];
    c2 = [r(1) ;r(2);r(3) - cao];
    c3 = [d1(1) ;d1(2);d1(3) - cao];
    c4 = [d2(1) ;d2(2);d2(3) - cao];
    lw = 1;
    clr = [0 0 0];
    draw_line(dd,r,lw,clr);
    draw_line(r,d2,lw,clr);
    draw_line(dd,d1,lw,clr);
    draw_line(d1,d2,lw,clr);
    draw_line(dd,c1,lw,clr);
    draw_line(r,c2,lw,clr);
    draw_line(d1,c3,lw,clr);
    draw_line(d2,c4,lw,clr);
end
function draw_line(p1, p2, lw, clr)
line([p1(1,1),p2(1,1)],[p1(2,1),p2(2,1)],[p1(3,1),p2(3,1)],'LineWidth',lw,'Color',clr);
end