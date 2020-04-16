function drawplane(P1,P2,P3,P4,color)
%Input four vectors P1,P2,P3,P4 the coordinates vertices of finite rectangular plane.  
%P1 = [0 0 0]
%P2 = [2 0 0]
%P3 = [2 4 0]
%P4 = [0 4 0]
%color=[250,227,135]
x = [P1(1) P2(1) P3(1) P4(1)];
y = [P1(2) P2(2) P3(2) P4(2)];
z = [P1(3) P2(3) P3(3) P4(3)];
fill3(x, y, z,color);
end