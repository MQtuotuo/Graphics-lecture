# -*- coding: utf-8 -*-
import math
import numpy  as np
import mayavi.mlab as mlab  
import pickle

# The following three lines will load the "pickled" arrays V and F from the
# pickle file dino.pkl. V represents the vertices of the model as Nx3 matrix,
# while N is the number of vertices the model consists of. F represent the
# faces (here triangles of the model). F is also a Nx3 matrix, while here N
# represents the number of the faces the model.
fid = open('dino.pkl', 'rb')
(V, F) = pickle.load(fid)
fid.close()

# a small wrapper function around mlab's triangular_mesh that you need to complete
# input are the face-vertex indices inside an (M x 3) array F
# and the vertices in a (N x 3) array V
def trimesh(F, V, new_figure=True):
    if new_figure:
        mlab.figure()
    
    # use mlab.triangular_mesh to plot the triangle mesh

# small helper function that is used to visualize the coordinate axes
def draw_axes():
    mlab.points3d(1, 0, 0, 1, scale_factor=0.1, color=(1, 0, 0))
    mlab.points3d(0, 1, 0, 1, scale_factor=0.1, color=(0, 1, 0))
    mlab.points3d(0, 0, 1, 1, scale_factor=0.1, color=(0, 0, 1))
    mlab.plot3d([0, 1], [0, 0], [0, 0])
    mlab.plot3d([0, 0], [0, 1], [0, 0])
    mlab.plot3d([0, 0], [0, 0], [0, 1])

#%% first task: just show the model
# show dino triangle mesh (complete trimesh() above to solve this task)
trimesh(F, V)
draw_axes()

#%% second task: scale & move model
# scale & move dino

# show a cylinder at the origin
mlab.figure()
draw_axes()

# set up transformation matrix & scale & move model
# show results
trimesh(F, V_transformed, new_figure=False)

#%% third task: rotate model around z-axis
mlab.figure()
draw_axes()

# set up transformation matrix & rotate model
# show results
trimesh(F, V_transformed_90, new_figure=False)
trimesh(F, V_transformed_45, new_figure=False)
