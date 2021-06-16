function [X,P,A,B,H] = init(y,lambda)

X=[0;0;y];
A=eye(size(X));
Py=covobs(X,lambda);
P=[zeros(2,size(X,1));zeros(size(Py,1),2),Py];
H=[zeros([size(X,1)-2 2]) eye(size(X,1)-2)];
for i=1:size(y)
    pair=mod(i,2);
    H(i,2-pair)=-1;
end
A=eye(1);
N=size(X,1)-2;
B=[eye(2);zeros(N,2)];