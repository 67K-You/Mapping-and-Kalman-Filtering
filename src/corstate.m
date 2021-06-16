function [P,X]=corstate (Xstar,Pstar,Ystar,Y,H,Py);

K=Pstar*H'*inv(H*Pstar*H'+Py);
X=Xstar+K*(Y-Ystar);
P=Pstar-K*H*Pstar;