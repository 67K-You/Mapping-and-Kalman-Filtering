function [Xstar,Pstar]=statepred(X,u,B,P,Q)
B
Xstar=X;
Xstar(1,1)=Xstar(1,1)+u(1);
Xstar(2,1)=Xstar(2,1)+u(2);

Pstar=P+B*Q*B';