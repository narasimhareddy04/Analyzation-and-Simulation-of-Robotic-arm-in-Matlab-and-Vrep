# Analyzation-and-Simulation-of-Robotic-arm-in-Matlab-and-Vrep
A robotic arm with RRRPRR configuration(6 degrees of freedom) .Denavit Hartenberg matrices are used for movement.Newton-Raphson method used for solving Inverse Kinematics.
Run function robo.m
Input is 4x4 Matrix
[T(0,0,0) [x;y;z];0 0 0 1];
where function T(theta1,theta2,theta3)
Returns a 3x3 rotation matrix.
theta1=rotation about x-axis in radians
theta2=rotation about y-axis in radians
theta3=rotation about z-axis in radians
This gives orientation of end effector
[x;y;z] are coordinates of end effector
e.g. robo([T(0,0,0) [0;0;10];0 0 0 1])
and it will show a arm in this position in MATLAB figure if possible ,else will get very close to it.
Created an industrial office type environment in Vrep and had simulated a UR-5 robotic arm for pick and place operation using Peter Corke
robotics toolbox in Matlab
