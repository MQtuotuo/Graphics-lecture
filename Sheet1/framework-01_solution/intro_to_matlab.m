% Foundations of Graphics WS 2010
% <solution>
% Solution Introduction Sheet
% Stefan Hartmann, Michael Weinmann, Sebastian Merzbach

%% a) create a comment
% Kommentar

%% b) create a 1 x 4 row vector
row_vector = [1, 2, 3, 4];

%% c) create a 5 x 1 column vector
column_vector = [1; 2; 3; 4; 5];

%% d) create a zero matrix using a Matlab function
null_mat = zeros(4, 4);

%% e) print the second row of a 4 x 3 matrix
E = [1, 2, 3; 4, 5, 6; 7, 8, 9; 10, 11, 12];
disp(E(2, :));

%% f) print the third column of a 4 x 4 matrix
B = [1, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12; 13, 14, 15, 16];
disp(B(:, 3));

%% g) transpose a matrix
ET = E';

%% h) create two m x m matrices, multiply via matrix-multiplication and element-wise
H1 = reshape(1 : 16, 4, 4);
H2 = reshape(1 : 16, 4, 4);

H1 * H2
H1 .* H2

%% i) concatenate two matrices vertically and horizontally
Ihor = [H1, H2]
Iver = [H1; H2]

% alternative:
Ivcer2 = cat(1, H1, H2)
Ihor2 = cat(2, H1, H2)

%% j) print the size of a matrix
size(E)
% only print the larges dimension of a matrix
length(E)
% print total number of elements in a matrix
numel(E)

%% k) change 8 x 7 to 14 x 4 matrix
K1 = reshape(1 : 56, 8, 7);
K2 = reshape(K1, 14, 4);

%% l) replicate a 3 x 1 vector to a 3 x 1000 matrix
l = [3; 4; 2];
L = repmat(l, 1, 4);

%% m) replace all entries less than 0 by 0
M = [-1, 2, 3, -4; -5, -6, -7, -8; -9, 10, 11, -12];
M(M < 0) = 0

%% n) clear all active variables
clear;

%% o) clear all active variables, functions and breakpoints
clear all;

%% p) create a vector containing numbers between 1 and 100 with gaps of 7
p = 1 : 7 : 100;

%% q) create a vector with 100 entries, set every other entry to 0
q = randn(1, 100);
q(2 : 2 : end) = 0

%% r) create a vector with 100 entries, delete every other element
r = 1 : 100;
r(2 : 2 : end) = []

%% s) create two 1000 x 3 matrices and compute dot products of row vectors
S1 = rand(1000, 3);
S2 = rand(1000, 3);

% using loops
tic;
dot_products = zeros(1000, 1);
for i = 1 : 1000
    dot_products(i) = S1(i, :) * S2(i, :)';
end
toc

% using vectorization
t = tic;
dot_products = sum(S1 .* S2, 2);
toc(t)

%% t) invert matrices unrolled as row vectors
T = rand(1000, 4);

%M = rand(1000,1,4);
TInv = [T(:,4) -T(:,2) -T(:,3) T(:,1)];
TInv = TInv ./ repmat(T(:,1) .* T(:,4) - T(:,2) .* T(:,3), 1, 4)

%% u) write a function computing sum and product of two matrices
M = rand(400, 400);
N = rand(400, 400);

tic;
[Sum] = addAndMulMat(M,N);
toc

tic;
[Sum, Mul] = addAndMulMat(M,N);
toc

% </solution>

