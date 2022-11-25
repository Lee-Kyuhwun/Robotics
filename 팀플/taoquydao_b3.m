function [qd,vt] = taoquydao_b3(point,time,buoc,a1,a2)
    hang_p = size(point);
    cot_p = hang_p(2);
    hang_p = hang_p(1);
    dh_point  = zeros(hang_p,3);
    for i = 1:hang_p
        [dh_point(i,1),dh_point(i,2),dh_point(i,3)] = dh_scara(point(i,1),point(i,2),point(i,3),a1,a2);
    end
    
    pt = cell(hang_p-1,1);
    for i = 1:hang_p-1
        pt{i} = zeros(3,4);
        for j = 1:3
            pt{i}(j,1:4) = ([1 0 0 0;0 1 0 0;1 time(i) time(i)^2 time(i)^3;0 1 2*time(i) 3*time(i)^2]^-1 * [dh_point(i,j);0;dh_point(i+1,j);0])';
        end
    end
    
    ti = cell(hang_p-1,1);
    for i = 1:hang_p-1
        ti{i} = 0:buoc:time(i);
    end
    
    qd = cell(hang_p-1,1);
    vt = qd;
    for i = 1:hang_p-1
        qd{i} = [pt{i}(1,1) + pt{i}(1,2).*ti{i,1} + pt{i}(1,3).*ti{i,1}.^2 + pt{i}(1,4).*ti{i,1}.^3;
                pt{i}(2,1) + pt{i}(2,2).*ti{i,1} + pt{i}(2,3).*ti{i,1}.^2 + pt{i}(2,4).*ti{i,1}.^3;
                pt{i}(3,1) + pt{i}(3,2).*ti{i,1} + pt{i}(3,3).*ti{i,1}.^2 + pt{i}(3,4).*ti{i,1}.^3 ];
        vt{i} = [ pt{i}(1,2) + 2*pt{i}(1,3).*ti{i,1}.^1 + 3*pt{i}(1,4).*ti{i,1}.^2;
                pt{i}(2,2) + 2*pt{i}(2,3).*ti{i,1}.^1 + 3*pt{i}(2,4).*ti{i,1}.^2;
                pt{i}(3,2) + 2*pt{i}(3,3).*ti{i,1}.^1 + 3*pt{i}(3,4).*ti{i,1}.^2; ];

    end
    
    
    len0 = 0;
    for i = 1:hang_p - 1
        len0 = len0 + length(qd{i,1});
    end
    len0 = len0 - hang_p + 2;
    qd_c = zeros(3,len0);
    vt_c = qd_c;
    for i = 1:3
        len = 1;
        for j = 1:hang_p - 1
            temp = 1;
            for k = len:len+length(qd{j,1})-1
            qd_c(i,k) = qd{j,1}(i,temp);
            vt_c(i,k) = vt{j,1}(i,temp);
            temp = temp+1;
            end
            len = len+length(qd{j,1}(i,:))-1;
        end
    end
    qd = qd_c;
    vt = vt_c;
end