%%There is a comment

%%b----------exact numbers...
Mat_b = rand(1, 4);
%%c----------
Mat_c = rand(5, 1);
%%d----------
Mat_d = zeros(4,4);
%%e----------
Mat_e=rand(3);
temp_e=Mat_e(2,:);
disp(temp_e);
%%f----------
Mat_f=rand(4);
temp_f=Mat_f(:, 3);
%g----------
Mat_g=transpose(Mat_f);
%h----------
Mat_h1=rand(4);
Mat_h2=rand(4);
Mat_h3=Mat_h1*Mat_h2;
Mat_h4=Mat_h1.*Mat_h2;
%i----------
A = magic(5);
A(:, 4:5) = [];
B = magic(3)*100;
Mat_iv = vertcat(A,B);
A = magic(5);
A(4:5,:) = [];
Mat_ih = horzcat(A,B);
%j----------
Mat_j=size(A);
%k----------
Mat_temp=rand(8,7);
Mat_k = reshape(Mat_temp, 14, 4);
%l----------
Mat_l=rand(3, 1);
Mat_l=repmat(Mat_l,1,1000);
%m----------
Mat_m=rand(5,5);
Mat_m(Mat_m<0) = 0;
%n----------
clear;
%o----------
clear all;
%p----------
Mat_p=[1:7:100];
%q----------
Mat_q=rand(1,100);
Mat_q(2:2:end)=0;
%r----------
Mat_r=rand(1,100);
Mat_r(1:2:end)=[];
%s----------

%t----------
T=rand(1000,4);

T1=[T(:,4) -T(:,2) -T(:,3) T(:,1)];
T1=T1./repmat(T(:,1).*T(:,4) -T(:,2).*T(:,3),1,4)

Mat_r=rand(1000,4);
Mat_r1=Mat_r(1,:);
Mat_dev=Mat_r1(1)*Mat_r1(4)-Mat_r1(2)*Mat_r1(3);
Mat_inv=1/Mat_dev*[Mat_r1(4), -Mat_r1(2);-Mat_r1(3),Mat_r1(1)];

