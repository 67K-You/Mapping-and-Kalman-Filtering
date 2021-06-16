function [H,Yknown,Ynew] = nouveauH(Xstar,Y,seuil);

Yknown=[];
Ynew=[];
Hg=[];
Hd=[];
l=[];
 
for  i=1:2:size(Y)
    k=0;
    for j=3:2:size(Xstar)
        b=match(Y(i:i+1),Xstar(j:j+1),seuil);
        if b==1
            
            k=k+1;
            l=[l j j+1];
            Yknown=[Yknown ; Y(i:i+1)];
            Hg=[Hg ; -eye(2)];
            break
        end
    end
    if k==0
        Ynew=[Ynew ; Y(i:i+1)];
    end
end
 
Hd=zeros(size(Yknown,1),size(Xstar,1)-2);
 
for m=1:size(l,2)
    Hd(m,l(m)-2)=1;
end
 
%a=size(l,2)
%l
%Hg
%Hd
H=[Hg Hd];

    end

        
            
    