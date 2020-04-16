function drawfloor(n)
%Input half the number of blocks of finite rectangular chess like floor.
%drawfloor(10)
%This creates a floor of 21x21 chess like blocks
hold on;
for x=-n:n
    for y=-n:n
        P1=[x-1,y-1,0];
        P2=[x,y-1,0];
        P3=[x,y,0];
        P4=[x-1,y,0];
        if mod(y,2)==mod(x,2)
            X = [P1(1) P2(1) P3(1) P4(1)];
            Y = [P1(2) P2(2) P3(2) P4(2)];
            Z = [P1(3) P2(3) P3(3) P4(3)];
            fill3(X, Y, Z,(1/255)*[54,233,233]);
        else
            X = [P1(1) P2(1) P3(1) P4(1)];
            Y = [P1(2) P2(2) P3(2) P4(2)];
            Z = [P1(3) P2(3) P3(3) P4(3)];
            fill3(X, Y, Z,(1/255)*[255,255,255]);
        end
    end
end
end

    
    