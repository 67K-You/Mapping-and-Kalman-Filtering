function []=main_observPartiel(fichier)

close all;
addpath(genpath('.'));
clc;
rng(123456);
seuil=2;
lambda=0.1;


fileID=fopen(fichier,'r');
textscan(fileID,'percep :');
data=textscan(fileID,'%f');
Y=cell2mat(data);

[X,P,A,B,H]=init(Y,lambda);
trajectoirecorr=[0;0;X(1,1);X(2,1)];
trajectoirepred=[0;0;X(1,1);X(2,1)];
affichage(X,P,trajectoirecorr,trajectoirepred);

pause(1);


while ~feof(fileID)

    textscan(fileID,'odom :');
    odom=textscan(fileID,'%f');
    u=cell2mat(odom);
    Q=covodo(u,0.7);
    
    [Xstar,Pstar]=statepred(X,u,B,P,Q);
    trajectoirepred=[trajectoirepred;trajectoirepred(size(trajectoirepred,1)-1:end) + u];
    affichage(Xstar,Pstar,trajectoirecorr,trajectoirepred);
    pause(0.1);
    
    textscan(fileID,'percep :');
    data=textscan(fileID,'%f');
    Y=cell2mat(data);
    
    for i = 4:size(Y,1)/2
        Y(2*i-1) = Y(2*i-1)+trajectoirecorr(size(trajectoirecorr,1)-1);
        Y(2*i) = Y(2*i)+trajectoirecorr(size(trajectoirecorr,1));
    end
    
    [H,Yknown,Ynew] = nouveauH(Xstar,Y,seuil);
    
    Yknownstar = obspred(H,Xstar);
    
    Py = covobs([X(1:2);Yknown],0.7);
    [P,X]=corstate (Xstar,Pstar,Yknownstar,Yknown,H,Py);
    trajectoirecorr=[trajectoirecorr;trajectoirecorr(size(trajectoirecorr,1)-1:end) + Xstar(1:2)];
    
    [X,P,A,B]=nouveauPX(X,P,A,B,Ynew,lambda);
    affichage(X,P,trajectoirecorr,trajectoirepred);

    pause(0.1);
end

fclose(fileID);