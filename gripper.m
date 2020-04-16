function gripper (clientID,closing,j1,j2)
vrep=remApi('remoteApi');

   
    [r,p1]=vrep.simxGetJointPosition(clientID,j1,vrep.simx_opmode_blocking);
    [r,p2]=vrep.simxGetJointPosition(clientID,j2,vrep.simx_opmode_blocking);
    if(closing==1)
    if (p1 <(p2-0.008))
        vrep.simxSetJointForce(clientID,j1,10,vrep.simx_opmode_blocking);
        
         vrep.simxSetJointForce(clientID,j2,10,vrep.simx_opmode_blocking);
         vrep.simxSetJointTargetVelocity (clientID,j1,-0.01,vrep.simx_opmode_blocking);
          
         vrep.simxSetJointTargetVelocity (clientID,j2,-0.04,vrep.simx_opmode_blocking);
         
         
    else
         vrep.simxSetJointForce(clientID,j1,10,vrep.simx_opmode_blocking);
         vrep.simxSetJointForce(clientID,j2,10,vrep.simx_opmode_blocking);
        vrep.simxSetJointTargetVelocity (clientID,j1,-0.04,vrep.simx_opmode_blocking);
         
         vrep.simxSetJointTargetVelocity (clientID,j2,-0.04,vrep.simx_opmode_blocking);
        
         
    end
    else
        if(p1<p2)
             vrep.simxSetJointForce(clientID,j1,10,vrep.simx_opmode_blocking);
              vrep.simxSetJointForce(clientID,j2,10,vrep.simx_opmode_blocking);
            vrep.simxSetJointTargetVelocity (clientID,j1,0.04,vrep.simx_opmode_blocking);
            
         vrep.simxSetJointTargetVelocity (clientID,j2,0.02,vrep.simx_opmode_blocking);
        
        
        else
             vrep.simxSetJointForce(clientID,j1,10,vrep.simx_opmode_blocking);
              vrep.simxSetJointForce(clientID,j2,10,vrep.simx_opmode_blocking);
            vrep.simxSetJointTargetVelocity (clientID,j1,0.02,vrep.simx_opmode_blocking);
           
            vrep.simxSetJointTargetVelocity (clientID,j2,0.04,vrep.simx_opmode_blocking);
         
        
        end
    end
end