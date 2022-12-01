clc;
robot = importrobot("urdf\robot_hand_SLDASM.urdf");
%show(robot);
x = [0,input("x\n")];
y = [0,input("y\n")];
z = [0,input("z\n")];
a = [0,pi];
b = [0,pi/2];
c = [0,0];
if ~exist("configs")
    configs = timeseries([0;0;0;0;0;0],0.001);
end
last_configs = configs;
sim("ikSolver.slx");

time = 0:0.001:10;
length = size(time);
q = zeros(length(2),2,6);

for i =1:6
    for j=1:length(2)
        q(j,1,i)=time(j);
        if time(j) < 3
            q(j,2,i)=(configs.Data(i)-last_configs.Data(i))*time(j)/3.0+last_configs.Data(i);
        else
            q(j,2,i)=configs.Data(i);
        end
    end
end






