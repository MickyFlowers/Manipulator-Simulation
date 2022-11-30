clc;
robot = importrobot("urdf\robot_hand_SLDASM.urdf");
%show(robot);
x = [0,input("x\n")];
y = [0,input("y\n")];
z = [0,input("z\n")];
a = [0,pi];
b = [0,pi/2];
c = [0,0];
sim("ikSolver.slx");
time = 0:0.001:10;
length = size(time);
q = zeros(length(2),2,6);
for i =1:6
    for j=1:length(2)
        q(j,1,i)=time(j);
        if time(j) < 3
            q(j,2,i)=configs.Data(i)*time(j)/3.0;
        else
            q(j,2,i)=configs.Data(i);
        end
    end
end
j1 = q(:,:,1);
j2 = q(:,:,2);
j3 = q(:,:,3);
j4 = q(:,:,4);
j5 = q(:,:,5);
j6 = q(:,:,6);


