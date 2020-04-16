function drawline(V1,V2,colour)
%Input two vectors V1 and V2,the coordinates of starting and ending of line.  
%V1=[x1,y1,z1]
%V2=[x2,y2,z2]
V=[V2;V1];
plot3(V(:,1),V(:,2),V(:,3),colour);
end