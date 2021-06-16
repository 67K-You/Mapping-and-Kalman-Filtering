function [Bool]=match(A1,A2,seuil)
if norm(A1-A2)<=seuil
    Bool=1;
else 
    Bool=0;
end
