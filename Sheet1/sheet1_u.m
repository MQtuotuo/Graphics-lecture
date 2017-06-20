function [ sum, product ] = sheet1_u( m, n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if size(m)==size(n)
       sum=m+n;
else
    display 'cannot sum'
end

m_cols=size(m,2);
n_rows=size(n,1);

if m_cols==n_rows
    
product=m*n;

else
    display 'cannot product'
end

end

