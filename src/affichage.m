function [] =affichage(X,P,trajectoirecorr,trajectoirepred);
[s,n]=size(P);
 
hold off;
XCentre=X(1,1);
YCentre=X(2,1);
plot(X(1,1),X(2,1),'+y')
Rayon = P(size(P,1),size(P,2));
VTheta = 0:0.01:7;
XCercle = XCentre + Rayon * cos(VTheta);
YCercle = YCentre + Rayon * sin(VTheta);
plot(XCercle, YCercle,'--');
plot(XCentre, YCentre,'+g');
hold on;
for i = 2:s/2
    XCentre = X(2*i-1);
    YCentre = X(2*i);
    Rayon = P(i+1,i+1);
    VTheta = 0:0.01:7;
    XCercle = XCentre + Rayon * cos(VTheta);
    YCercle = YCentre + Rayon * sin(VTheta);
    plot(XCercle, YCercle,'--');
    plot(XCentre, YCentre,'+g');
end
plot(trajectoirecorr(1:2:end),trajectoirecorr(2:2:end),'-b');
plot(trajectoirepred(1:2:end),trajectoirepred(2:2:end),'--rx');
