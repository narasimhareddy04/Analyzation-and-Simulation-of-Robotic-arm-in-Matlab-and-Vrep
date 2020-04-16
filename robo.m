function robo(T)
% Input 4x4 Matrix
% [T(0,0,0) [x;y;z];0 0 0 1];
%function T(theta1,theta2,theta3)
%Returns a 3x3 rotation matrix.
%theta1=rotation about x-axis in radians
%theta2=rotation about y-axis in radians
%theta3=rotation about z-axis in radians
%e.g [T(0,0,0) [0;0;10];0 0 0 1];
x0=[0.1,0.01,0.01,-0.5,0.01,0.01];
xSol=fsolve(@(x) InvKinematics(x,T),x0);
roboarm(xSol(1),xSol(2),xSol(3),xSol(4),xSol(5),xSol(6));
end
 