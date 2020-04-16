clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% DH-Parameters using peter croke toolbox
% L = Link([Th   d   a   alpha])

L(1) = Link([0 0.089159 0.000000 pi/2]);
L(2) = Link([0 0.000000 -0.42500 0]);
L(3) = Link([0 0.000000 -0.39225 0]);
L(4) = Link([0 0.109150 0.000000 pi/2]);
L(5) = Link([0 0.094650 0.000000 -(pi/2)]);
L(6) = Link([0 0.082300 0.000000 0.000000]);

Rob = SerialLink(L);
Rob.name = 'UR5';
%Rob.plot([0.7885   -0.8350    0.6023    0.2327    2.3593   -1.5708])
Rob.teach
%Rob.offset=[0 -pi/2 0 -pi/2 0 0];
 T = transl(-0.45,0.65,0.4) * rpy2tr(0,90,180,'deg');
q = Rob.ikine(T);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while 1 > 0
vrep=remApi('remoteApi'); % creats aremot api object
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5); %creat connection
if (clientID>-1)
    disp('CONNECTED');
    %%%% handeles%%%%%%%%
    [returnCode,joint1]=vrep.simxGetObjectHandle(clientID,'UR5_joint1',vrep.simx_opmode_blocking);
    [returnCode,joint2]=vrep.simxGetObjectHandle(clientID,'UR5_joint2',vrep.simx_opmode_blocking);
    [returnCode,joint3]=vrep.simxGetObjectHandle(clientID,'UR5_joint3',vrep.simx_opmode_blocking);
    [returnCode,joint4]=vrep.simxGetObjectHandle(clientID,'UR5_joint4',vrep.simx_opmode_blocking);
    [returnCode,joint5]=vrep.simxGetObjectHandle(clientID,'UR5_joint5',vrep.simx_opmode_blocking);
    [returnCode,joint6]=vrep.simxGetObjectHandle(clientID,'UR5_joint6',vrep.simx_opmode_blocking);
    [returnCode,j1]=vrep.simxGetObjectHandle(clientID,'ROBOTIQ_85_active1',vrep.simx_opmode_blocking);
    [returnCode,j2]=vrep.simxGetObjectHandle(clientID,'ROBOTIQ_85_active2',vrep.simx_opmode_blocking);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [returnCode,p1]=vrep.simxGetJointPosition(clientID,j1,vrep.simx_opmode_blocking);
    [returnCode,p2]=vrep.simxGetJointPosition(clientID,j2,vrep.simx_opmode_blocking);
    if (p1<p2)
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,j1,0.04,vrep.simx_opmode_blocking);
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,j2,0.02,vrep.simx_opmode_blocking);
    else
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,j1,0.02,vrep.simx_opmode_blocking);
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,j2,0.04,vrep.simx_opmode_blocking);
    end

    pause(2)
    %[returnCode]=vrep.simxSetJointTargetVelocity(clientID,j1,0,vrep.simx_opmode_blocking)
    %ang = 200;
    
    
    %%%%%%%%%%%%%%%%%%
    %%%%pick
   T  = transl(-0.0,-0.3,0.6)* rpy2tr(180,0,0,'deg');
    c = Rob.ikine(T);
    
    
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,joint1,c(1),vrep.simx_opmode_blocking);
    pause(0.1)
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,joint2,c(2)+1.570796327,vrep.simx_opmode_blocking);
    pause(0.1)
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,joint3,c(3),vrep.simx_opmode_blocking);
    pause(0.1)
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,joint4,c(4),vrep.simx_opmode_blocking);
    pause(0.1)
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,joint5,c(5),vrep.simx_opmode_blocking);
    pause(0.1)
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,joint6,c(6),vrep.simx_opmode_blocking);
    pause(0.1)
    %[returnCode,p1]=vrep.simxGetJointPosition(clientID,j1,vrep.simx_opmode_blocking);
    %[returnCode,p2]=vrep.simxGetJointPosition(clientID,j2,vrep.simx_opmode_blocking);
   
   gripper(clientID,0,j1,j2);pause(30);
  gripper(clientID,1,j1,j2);pause(1.5);
   
    T  = transl(-0.45,0.0,0.7)* rpy2tr(0,0,0,'deg');
    c = Rob.ikine(T);
    
    
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,joint1,c(1),vrep.simx_opmode_blocking);
    pause(2.25);
   
   
    
    gripper(clientID,0,j1,j2);pause(0.002);
    
    
end

      %%%%%%%%%%%%%%%%%%%%%%%%%
end
      
      
      
      
 