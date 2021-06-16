function Py=covobs(Y,lambda);
d=sqrt(Y(3:2:end).^2+Y(4:2:end).^2);
D=zeros(1,2*size(d,1));
%size(d,1)
D(1:2:end)=d;
D(2:2:end)=d;
Py=lambda*diag(D);
Py=sparse(Py);
