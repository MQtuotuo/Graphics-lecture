Mat_1=rand(1000,3);
Mat_2=rand(1000,3);

tic;
for i=1:1000
    A=Mat_1(i,:);
    B=Mat_2(i,:);
    C=dot(A, B);
end
toc;

tic;
A=Mat_1(1,:);
B=Mat_2(1,:);
C=dot(A, B);

toc;
