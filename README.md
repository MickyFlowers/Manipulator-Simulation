# 六轴机械臂仿真

## 1	简介

- 在六轴机械臂的研发中，需要对机械臂关节电机的力矩进行选型。在绘制出简要的机械模型后，基于`Simulink/Simscape`进行模型仿真，根据关节力矩对电机/减速器进行选型
- 本次仿真有较大的局限性：
  - 逆运动学解算与`Simscape Multibody`仿真分离
  - 单次仿真步长为`0.001s`，仿真总时间为10s，并未做到循环仿真
  - 控制器为简单的`双环PID`，参数未细调

- 仿真模型与结果仅供参考

## 2	文件结构

```
.\
│  CMakeLists.txt				#cmake文件
│  package.xml					#包依赖说明文件
│  robot_show.m					#导入并显示机器人模型，输入目标点坐标-姿态
│  robot_hand_SLDASM.slxc		
│  ikSolver.slxc
│  ikSolver.slx					#逆运动学解算-simulink
│  robot_hand_SLDASM.slx		#仿真模型-simulink
│
├─config  						#配置文件-ROS
├─launch						#launch文件-ROS
├─meshes						#模型材料/颜色说明
├─urdf							#urdf模型文件夹
├─textures
├─image							#image in docA
├─CFL_Core						#Matlab附加功能：Simscape Contact Force Library
└─slprj							#CFL工程文件夹

```

`slprj`文件夹说明：[`slprj folder`]([slprj文件夹 – MATLAB中文论坛 (ilovematlab.cn)](https://www.ilovematlab.cn/thread-214871-1-1.html))

## 3	环境配置

### Matlab Simscape Contact Force Library安装

Matlab Simscape Contact Force Library 库是Matlab中的附加功能，在Simscape Multibody仿真中定义物体之间的碰撞力，该库目前对于3D仿真只支持以下几种模型，因此并不能完全定义物体的任一表面，因此在仿真时可对其进行简化。[MathWorks文档](https://ww2.mathworks.cn/matlabcentral/fileexchange/47417-simscape-multibody-contact-forces-library?s_tid=srchtitle_Contact Force_2)

![3d_library](./image/3d_library.jpg)

在Matlab Simscape Contact Force Library中选择对应Matlab的版本（本次仿真为R2022a）进行下载，将解压后文件夹中的`CFL_Core`文件夹放入工作空间中即可使用。

除此之外Matlab所下载的附加功能包默认存放在`C:\Users\UserName\AppData\Roaming\MathWorks\MATLAB Add-Ons\Collections`当中

### 其他安装

- Simulink/Simscape
- Simscape Multibody
- Robotic System Toolbox

## 4	仿真说明
