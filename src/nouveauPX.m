function [X,P,A,B]=nouveauPX(X,P,A,B,Ynew,lambda)
X=[X;Ynew];
Py=covobs(X,lambda);
P=[zeros(2,size(X,1));zeros(size(Py,1),2),Py];
 
A=eye(size(X)-2);
N=size(X,1)-2;
B=[eye(2);zeros(N,2)];
