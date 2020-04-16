function roboarm(theta1z,theta2x,theta3x,theta4p,theta5z,theta6x)
%It creates RRRRPR configuration robotic arm where inputs are amount of
%rotation (translation in case of prismatic joint) by each joint
hold off;
drawfloor(10);
hold on;
grid;
xlabel('x'); ylabel('y'); zlabel('z');
P0=[T(0,0,0) [0;0;0];0 0 0 1];
P1=P0*[T(0,0,0) [0;0;10];0 0 0 1];
drawcylinder([P0(1,4) P0(2,4) P0(3,4)],[P1(1,4) P1(2,4) P1(3,4)],1,'b');
drawcylinder([P1(1,4) P1(2,4) P1(3,4)]-[0 0 1],[P1(1,4) P1(2,4) P1(3,4)]+[0 0 1],1.5,'r');
P2=P1*[T(0,0,theta1z) [0;0;0];0 0 0 1]*[T(0,0,0) [2;0;0];0 0 0 1];
drawcylinder([P1(1,4) P1(2,4) P1(3,4)],[P2(1,4) P2(2,4) P2(3,4)],1.5,'r');
P3=P2*[T(theta2x,0,0) [0;0;0];0 0 0 1]*[T(0,0,0) [0;0;10];0 0 0 1];
drawcylinder([P2(1,4) P2(2,4) P2(3,4)],[P3(1,4) P3(2,4) P3(3,4)],1,'b');

P4=P3*[T(theta3x,0,0) [0;0;0];0 0 0 1]*[T(0,0,0) [-2;0;0];0 0 0 1];
drawcylinder([P3(1,4) P3(2,4) P3(3,4)],[P4(1,4) P4(2,4) P4(3,4)],1.5,'r');

P5=P4*[T(0,0,0) [0;0;theta4p];0 0 0 1];
C4=[P4(1,4) P4(2,4) P4(3,4)];
C5=[P5(1,4) P5(2,4) P5(3,4)];
drawcylinder(C4-(1.5*((C5-C4)/norm(C5-C4))),C4+(1.5*((C5-C4)/norm(C5-C4))),1.5,'r');
drawcylinder(C5-(10*((C5-C4)/norm(C5-C4))),C5,1,'b');
C52=(C5-10*((C5-C4)/norm(C5-C4)));
P52=[P5(1,1) P5(1,2) P5(1,3) C52(1);
     P5(2,1) P5(2,2) P5(2,3) C52(2);
     P5(3,1) P5(3,2) P5(3,3) C52(3);
     P5(4,1) P5(4,2) P5(4,3) P5(4,4)];   
P6=P52*[T(0,0,theta5z) [0;0;0];0 0 0 1]*[T(0,0,0) [2;0;0];0 0 0 1];
C6=[P6(1,4) P6(2,4) P6(3,4)];
drawcylinder((C52-((C52-C5)/norm(C52-C5))),(C52+((C52-C5)/norm(C52-C5))),1.5,'r');
drawcylinder((C5-10*((C5-C4)/norm(C5-C4))),C6,1.5,'r');

P7=P6*[T(theta6x,0,0) [0;0;0];0 0 0 1]*[T(0,0,0) [0;0;10];0 0 0 1];
drawcylinder([P6(1,4) P6(2,4) P6(3,4)],[P7(1,4) P7(2,4) P7(3,4)],1,'b');
P7
drawline([P7(1,4) P7(2,4) P7(3,4)],[P7(1,4) P7(2,4) P7(3,4)]+([P7(1,4) P7(2,4) P7(3,4)]-[P6(1,4) P6(2,4) P6(3,4)]),'g');
end
