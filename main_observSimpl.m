function []=main_observSimpl(fichier);

close all;
addpath(genpath('.'));
clc;
rng(123456);
lambda=0.7;


fileID=fopen(fichier,'r');
red=textscan(fileID,'percep :');
data=textscan(fileID,'%f');
Y=cell2mat(data);

[X,P,A,B,H]=init(Y,lambda);

trajectoirecorr=[X(1,1);X(2,1)];
trajectoirepred=[X(1,1);X(2,1)];
affichage(X,P,trajectoirecorr,trajectoirepred);

pause(1);


while ~feof(fileID)

    
    red=textscan(fileID,'odom :');
    odom=textscan(fileID,'%f');
    u=cell2mat(odom);
    Q=covodo(u,1);
    
    [Xstar Pstar]=statepred(X,u,B,P,Q);
    trajectoirepred=[trajectoirepred;trajectoirepred(size(trajectoirepred,1)-1:end) + u];
    
    affichage(Xstar,Pstar,trajectoirecorr,trajectoirepred);
    pause(0.2);
    red=textscan(fileID,'percep :');
    data=textscan(fileID,'%f');
    Y=cell2mat(data);
    Ystar = obspred(H,Xstar);
    
    Py = covobs(X,0.7);
    [P X]=corstate (Xstar,Pstar,Ystar,Y,H,Py);
    trajectoirecorr=[trajectoirecorr;X(1,1);X(2,1)];
    affichage(X,P,trajectoirecorr,trajectoirepred);
    
    
    pause(0.2);
end