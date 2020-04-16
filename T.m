function TW=T(theta1,theta2,theta3)
%Returns a 3x3 rotation matrix.
%theta1=rotation about x-axis in radians
%theta2=rotation about y-axis in radians
%theta3=rotation about z-axis in radians
TW =[cos(theta2)*cos(theta3),-cos(theta2)*sin(theta3),-sin(theta2);
    cos(theta1)*sin(theta3)-cos(theta3)*sin(theta1)*sin(theta2), cos(theta1)*cos(theta3)+sin(theta1)*sin(theta2)*sin(theta3), -cos(theta2)*sin(theta1);
    sin(theta1)*sin(theta3)+cos(theta1)*cos(theta3)*sin(theta2),cos(theta3)*sin(theta1)-cos(theta1)*sin(theta2)*sin(theta3),cos(theta1)*cos(theta2)];
end