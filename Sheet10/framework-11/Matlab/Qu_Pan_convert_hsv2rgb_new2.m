function img= convert_hsv2rgb_new2(img_hsv)
%%get  H S V from image
h = img_hsv(:,:,1);
s= img_hsv(:,:,2);
v = img_hsv(:,:,3);

%%H'=H/60; H=[0 ,360], for matlab hue is a linear ramp from 0 to 1
h=h*6;

%% Hints(1) and (3)
c=v.*s;
a=1-abs( mod(h,2)-1);
x=c.*a;

%%loop for image
row=size(h,1);
line=size(h,2);
%%Hints(4)
for i=1:row
     for j=1:line
      if h(i,j)>=0 & h(i,j)<1
      r(i,j)=c(i,j);
      g(i,j)=x(i,j);
      b(i,j)=0;
      else if  h(i,j)>=1 & h(i,j)<2
      r(i,j)=x(i,j);
      g(i,j)=c(i,j);
      b(i,j)=0;
       else if  h(i,j)>=2 & h(i,j)<3
      r(i,j)=0;
      g(i,j)=c(i,j);
      b(i,j)=x(i,j); 
           else if  h(i,j)>=3 & h(i,j)<4
      r(i,j)=0;
      g(i,j)=x(i,j);
      b(i,j)=c(i,j); 
               else if  h(i,j)>=4 & h(i,j)<5
       r(i,j)=x(i,j);
      g(i,j)=0;
      b(i,j)=c(i,j); 
                   else if  h(i,j)>=5 & h(i,j)<6
      r(i,j)=c(i,j);
      g(i,j)=0;
      b(i,j)=x(i,j);
                       end
                   end
               end
           end
          end
      end
     end
end

%%Hints(5) and(6)
m=v-c;
R=r+m;
G=g+m;
B=b+m;

%%Combine 3 channel
img(:,:,1)=R;
img(:,:,2)=G;
img(:,:,3)=B;

end