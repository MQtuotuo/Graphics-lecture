#%% -*- coding: utf-8 -*-
#%% <solution>
"""
Created on Mon Nov  2 17:17:38 2015

@author: merzbach
"""
import numpy as np

#%% a) a comment!

#%% b) 1 x 4 row vector
b = np.array([1, 2, 3, 4]).reshape(1, 4)

#%% c) 5 x 1 column vector
c = np.array([1, 2, 3, 4, 5]).reshape(5, 1)

#%% d) zero matrix
Z = np.matrix(np.zeros([3, 3]))

#%% e) print second row of 4 x 3 matrix
E = np.matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]])
print(E[1,:],)

#%% f) print third row of 4 x 4 matrix
F = np.concatenate((E, np.matrix([13, 14, 15, 16]).reshape(4, 1)), axis=1)
print(F[:, 2])

#%% g) transpose array
G = np.array(E)
G.transpose()
G.T

#%% h) create two m x m arrays & multiply as matrices and as arrays respectively
H1 = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
H2 = H1
H1 * H2
np.matrix(H1) * np.matrix(H2)
H1.dot(H2)
np.dot(H1, H2)

#%% or
np.dot(H1, H2)

#%% i) concatenate two arrays vertically and horizontally
I1 = np.concatenate((H1, H2), axis=0)
I2 = np.concatenate((H1, H2), axis=1)

#%% j) print size of an array
print(I1.shape)

#%% k) change 8 x 7 array to 14 x 4
K = np.arange(1, 57).reshape(8, 7)
Kr = K.reshape(14, 4)
K
Kr

#%% l) replicate a 3 x 1 vector to an 3 x 1000 array
l = np.array([1, 2, 3]).reshape(3, 1)
L = np.repeat(l, 1000, axis=1)
L.shape

#%% m) replace matrix entries < 0 by 0
M = np.random.rand(3, 2) - 0.5
M[M < 0] = 0
M

#%% n) vector from 1 to 100 with gaps of 7
n = np.arange(1, 100, 7)

#%% o) vector with 100 elements, set every second element to 0
o = np.random.rand(1, 100)
o[:, 0:99:2] = 0
#%% or
o[:, ::2] = 0

#%% p) create vector with 100 elements, delete every other element
p = np.random.rand(1, 100)
p = p[:, ::2]

#%% q) create two random 1000 x 3 arrays
Q1 = np.random.rand(1000, 3)
Q2 = np.random.rand(1000, 3)

#%% r) compute dot product between all 1 x 3 vectors
import time
start_time = time.time()
for ii in np.arange(Q1.shape[0]):
    foo = np.dot(Q1[ii], Q2[ii])
    # or
 #   dot_prod = 0
 #   for jj in np.arange(0, 3):
 #       dot_prod += Q1[ii, jj] * Q2[ii, jj]
 #    print(dot_prod)
end_time = time.time()
print('%f seconds passed' %(end_time - start_time))

#%% s) above dot product without loops:
start_time = time.time()
dot_prod = np.sum(Q1 * Q2, axis=1)
end_time = time.time()
print('%f seconds passed' %(end_time - start_time))

#%% t) invert 1000 2 x 2 matrices
T = np.random.rand(1000, 4)
Tinv = np.repeat(1 / (T[:, 0] * T[:, 3] - T[:, 1] * T[:, 2]).reshape(1000, 1), 4, axis=1) * np.concatenate((T[:, 3].reshape(-1, 1), -T[:, 1].reshape(-1, 1), -T[:, 2].reshape(-1, 1), T[:, 0].reshape(-1, 1)), axis=1)

np.matrix(T[0, :].reshape(2, 2)) * np.matrix(Tinv[0, :].reshape(2, 2))

#%% u) function for computing sum and product of two m x m matrices
def sum_prod(A, B):
    return (A + B, A * B)

U1 = np.random.rand(2, 2)
U2 = np.random.rand(2, 2)
sum_prod(U1, U2)

#%% </solution>