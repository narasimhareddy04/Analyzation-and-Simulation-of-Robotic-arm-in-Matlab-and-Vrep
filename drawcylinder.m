function drawcylinder(P1,P2,radius,color)
%Creates a finite cylinder having starting and ending points P1 and P2
%respectively and given radius and color
%P1=[x1,y1,z1]
%P2=[x2,y2,z2]

%Get the direction of axis
N=P2-P1;

%Make it a unit vector by deviding it by its modulus
N=N/norm(N);

%Take it's cross product with Z-axis to find it's angle with Z-axis as 
%cylinder's body by default will be defined about Z-axis and later will be 
%rotated to it's original axis. 
N=cross(N,[0 0 1]);

%Take out the scalars for easy handling
p=N(1);
q=N(2);
r=N(3);

%Make variable for covering axis by very thin rectangular planes which
%would look like aproximate cylinder
t=0:.1:2*pi;

%Get size of the variable
[m n]=size(t);

%Initialize the matrix to store coordinates of vertices of thin planes
%around axis
x = zeros(1,n);
y = zeros(1,n);
z = zeros(1,n);

%define the coordinates around Z*axis
for i=1:n
    x(i) = radius*cos(t(i));
    y(i) = radius*sin(t(i));
    z(i) = 0*t(i);
end

%Make result compact
P=[x;y;z]';

%Rotate the coordinates in such a way that the Y coordinate becomes zero 
%after rotation 
if r==0
    thetax=-pi/2;
else
    thetax=-atan(q/r);
end
X=((r/(q^2/r^2 + 1)^(1/2) + q^2/(r*(q^2/r^2 + 1)^(1/2))));
if isnan(X)
    X=Inf;
end

%Rotate the coordinates in such a way that the Z coordinate becomes zero 
thetay=atan(-p/X);
%Rotate the coordinates with angle equal to magnitude of actual difference 
%of angle between required orientation and and Z-axis 
thetaz=asin(norm(N));
Tx=T(thetax,0,0);
Ty=T(0,thetay,0);
Tz=T(0,0,thetaz);
C0=P*Tx*Ty*Tz/Ty/Tx;

%Define vertices of required planes around required axis
C1=[P1(1)+C0(:,1),P1(2)+C0(:,2),P1(3)+C0(:,3)];
C2=[P2(1)+C0(:,1),P2(2)+C0(:,2),P2(3)+C0(:,3)];
hold on

%Draw the cylinder
for i=1:n-1
    drawplane(C1(i,:),C2(i,:),C2(i+1,:),C1(i+1,:),color);
end

%Last plane to close the curved area
drawplane(C1(n,:),C2(n,:),C2(1,:),C1(1,:),color);

%Two lids
fill3(C1(:,1),C1(:,2),C1(:,3),color);
fill3(C2(:,1),C2(:,2),C2(:,3),color);
end