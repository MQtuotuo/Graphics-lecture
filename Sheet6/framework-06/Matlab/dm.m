clear all;
data=[1 8; 2 7; 7 2; 4 6; 6 3; 5 2; 0 -1; 3 7];
K=2;
[index, centers] = my_kmeans(data, K);