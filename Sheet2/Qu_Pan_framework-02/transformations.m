%%
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

%% Transformations Assignment Sheet 2 - Task 1
clear;
% After loading the dino.mat file you will see a variable V and F in
% your workspace.
% V represents the vertices of the model as Nx3 matrix, while N is the
% number of vertices the model consists of.
% F represent the faces (here triangles of the model). F is also a Nx3
% matrix, while here N represents the number of the faces the model.
load dino
Vorig = V;
%% Show Trimesh using faces in F and the vertices V of the dino model.
% use the command trimesh to show the triangle mesh
% the function returns a handle which can be used to set the color of the object
% as shown below
figure();
draw_axes();

h = trimesh(F,V(:,1),V(:,2),V(:,3));

% This command is used to lighten the model. You can use this command 
% to assign different colors to the model. Please use diffenrent colors for
% different rotations. Check the Matlab Help for "Face Color".
set(h,'FaceLighting','phong','FaceColor','b','EdgeColor','none',...
      'AmbientStrength',0.5)
light('Position',[-1 -1 1],'Style','infinite');

% zoom in a bit by specifying a smaller bounding box
axis([-1 1 -1 1 -0.1 1]);

%% Scale the dino model as described in task b)
figure()
draw_axes();

% cylinder at the origin

grid on
hold on
% set up the scaling matrix
Scale=diag([5,5,5],0);
Vorig = Scale*V';
% show the results
h = trimesh(F,Vorig (1,:),Vorig (2,:),Vorig (3,:));

% show the results


translate = [1 0 0 5
             0 1 0 0
             0 0 1 0
             0 0 0 1];
         % homogeneous translation matrix
Rev = [Vorig;ones(1,7450)];
trs=translate*Rev;
h = trimesh(F,trs(1,:),trs(2,:),trs(3,:));

hold off;

%% rotate model around z-axis as described in task c)
figure();
draw_axes();

% set up the rotation matrix for rotating 90 degrees
R1 = [cosd(90) -sind(90) 0
      sind(90)  cosd(90) 0
      0           0      1 ];%set up the homogeneous rotation matrix
% apply the homogeneous matrix by the rotation matrix, after this action, a matrix containing the
Rotal = R1 *  V';
% show the results
h = trimesh(F,Rotal(1,:),Rotal(2,:),Rotal(3,:));
hold on;
% set up the rotation matrix for 45 degrees
R2 = [cosd(45) -sind(45) 0 0
     sind(45) cosd(45)   0 0
      0        0         1 0
      0        0         0 1];
Tm1 = [1 0 0 -5
       0 1 0 0
       0 0 1 0
       0 0 0 1];% homogeneous translation matrix
Tm2 = [1 0 0 5
       0 1 0 0
       0 0 1 0
       0 0 0 1];% homogeneous translation matrix
   
% show the results
Rotal2 = Tm2*(R2*(Tm1*trs));
% First of all, apply matrix Rev with Tm1 which aims to transform the
%model to a new coordinate system that the axis z' is parallel with
% the original z axis and pass the point (5;0;0). Then do the rotation
% action, finally, translate it again back to the original coordinate system
% show the results
h = trimesh(F,Rotal2(1,:),Rotal2(2,:),Rotal2(3,:));
hold off;
