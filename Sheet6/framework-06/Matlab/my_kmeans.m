function [index, centers] = my_kmeans(data, K)
%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan
    % <exercise>
    % The variable 'data' contains data points in its rows.  
    % Initilize 'k' centers randomized.  Afterwards apply Floyd's algorithm
    % until convergence to get a solution of the k-means problem.  Utilize
    % 'knnsearch' for nearest neighbor computations.
    %
    % </exercise>
  
%data - M*N matrix,each row is a sample with dimensionality N
%K - number of clusters you want to find
%index - M*1 column vector indicating which cluster centroid a sample is assigned to
%centers - K*N matrix,each row is a cluster centroid
%his - value of distortion function over each iteration

%maxIter=10;

err=10;
%Initializing K cluster centroids by randomly choosing K samples from given data
[M,N]=size(data);
centers=data(randi(M,K,1),:);
his=[];
J=0;%distortion function,decreasing all the time
index=zeros(M,1);
Iter=1;
%while err>1e-4&&Iter<maxIter %repeat until convergence
while err>1e-4 %repeat until convergence
    %Assign a cluster centroid to each sample
    J_new=0;
    for idx=1:M
        dist=sum((centers-repmat(data(idx,:),K,1)).^2,2);%distance between idx-th sample and each cluster centroid
        mindist=min(dist);
        id=find(dist==mindist);%id of the cluster centroid nearest the idx-th sample
        index(idx)=id(1);%assign the id-th cluster centroid to idx-th sample
        J_new=J_new+mindist;
    end
    his=[his J_new];

    %Updating the cluster centroids
    for id=1:K
        index_k=find(index==id);%index of samples belong to id-th cluster centroid
        centers(id,:)=sum(data(index_k,:),1)/size(index_k,1);
    end
    err=abs(J_new-J);
    J=J_new;
    %Iter=Iter+1;
end