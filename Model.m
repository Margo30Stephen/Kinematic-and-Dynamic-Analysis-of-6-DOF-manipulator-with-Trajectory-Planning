dh_param=[0 0 0.680 0;
         0.32 pi/2 0 0;
         0.975 0 0 0;
         0.2 pi/2 0.887 0; 
         0 -pi/2 0 0;
         0 pi/2 0 0;
         0 0 0.2 0;];  
 
SIX_DOF_mdh=rigidBodyTree('DataFormat','row');
SIX_DOF_mdh.Gravity=[0 0 -9.81];
basename=SIX_DOF_mdh.Base;
addVisual(basename,"Mesh","STL Files/Base.stl");

L1=rigidBody('L1');
J1=rigidBodyJoint('J1','revolute');
addVisual(L1,'Mesh',"STL Files/Link1.stl",[1 0 0 0;0 1 0 0;0 0 1 -0.45;0 0 0 1]);
setFixedTransform(J1,dh_param(1,:),'mdh');
J1.PositionLimits=[-deg2rad(170) deg2rad(170)];
L1.Joint=J1;
L1.Mass= 81.84;
L1.CenterOfMass=[0 0 0];
L1.Inertia=[3.54 5.73 4.53 0.33 1.64 0.28];

L2=rigidBody('L2');
J2=rigidBodyJoint('J2','revolute');
setFixedTransform(J2,dh_param(2,:),'mdh');
addVisual(L2,'Mesh','STL Files/Link2.stl',[0 0 1 0;-1 0 0 0;0 -1 0 0.1305;0 0 0 1]);
J2.PositionLimits=[-deg2rad(65) deg2rad(140)];
J2.HomePosition=pi/2;
L2.Joint=J2;
L2.Mass= 41.11;
L2.CenterOfMass=[0.42 0 0.22];
L2.Inertia=[2.31 13.18 11.31 -0.01 4.14 -0.02];

L3=rigidBody('L3');
J3=rigidBodyJoint('J3','revolute');
setFixedTransform(J3,dh_param(3,:),'mdh');
addVisual(L3,'Mesh','STL Files/Link3.stl',[1 0 0 0;0 1 0 0;0 0 1 0.2255;0 0 0 1]);
J3.PositionLimits=[-deg2rad(180) deg2rad(70)];
%J3.HomePosition=pi/2;
L3.Joint=J3;
L3.Mass= 50;
L3.CenterOfMass=[0.12 0.05 -0.01];
L3.Inertia=[1.62 2.19 2.19 -0.21 -0.31 0.48];

L4=rigidBody('L4');
J4=rigidBodyJoint('J4','revolute');
setFixedTransform(J4,dh_param(4,:),'mdh');
addVisual(L4,'Mesh','STL Files/Link4.stl',[1 0 0 0;0 1 0 0;0 0 1 -0.705;0 0 0 1]);
J4.PositionLimits=[-deg2rad(300) deg2rad(300)];
L4.Joint=J4;
L4.Mass= 36.15;
L4.CenterOfMass=[0 0.01 -0.31];
L4.Inertia=[5.28 5 0.51 0 0 0];

L5=rigidBody('L5');
J5=rigidBodyJoint('J5','revolute');
setFixedTransform(J5,dh_param(5,:),'mdh');
addVisual(L5,'Mesh','STL Files/Link5.stl',[1 0 0 0;0 1 0 0;0 0 1 0.102;0 0 0 1]);
J5.PositionLimits=[-deg2rad(130) deg2rad(130)];
L5.Joint=J5;
L5.Mass= 6.36;
L5.CenterOfMass=[0 -0.04 0];
L5.Inertia=[0.06 0.03 0.06 0 0 0];

L6=rigidBody('L6');
J6=rigidBodyJoint('J6','revolute');
addVisual(L6,'Mesh','STL Files/Link6.stl',[1 0 0 0;0 1 0 0;0 0 1 0.168;0 0 0 1]);
setFixedTransform(J6,dh_param(6,:),'mdh');
J6.PositionLimits=[-deg2rad(300) deg2rad(300)];
L6.Joint=J6;
L6.Mass= 0.92;
L6.CenterOfMass=[0 0 0.18];
L6.Inertia=[0.03 0.03 0 0 0 0];

Gripper=rigidBody('Gripper');
J7=rigidBodyJoint('J7');
setFixedTransform(J7,dh_param(7,:),'mdh');
Gripper.Joint=J7;

addBody(SIX_DOF_mdh,L1,'base');
addBody(SIX_DOF_mdh,L2,'L1');
addBody(SIX_DOF_mdh,L3,'L2');
addBody(SIX_DOF_mdh,L4,'L3');
addBody(SIX_DOF_mdh,L5,'L4');
addBody(SIX_DOF_mdh,L6,'L5');
addBody(SIX_DOF_mdh,Gripper,'L6');

save('SIX.mat','SIX_DOF_mdh')