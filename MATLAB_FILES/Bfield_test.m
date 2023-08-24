function Bfield_test(mu,n,i,L,a)
clc;
r=linspace(0.001,3*a,100);
z=0.2*L/2;
C1=(mu*n*i)/pi;
C2=(a./r).^(1/2);

zeta1=z+(L/2);
zeta2=z-(L/2);

for i=1:length(z)
    for j=1:length(r)
k1(i,j)=sqrt((4*a.*r(j))./(zeta1(i).^2+(a+r(j)).^2));
k2(i,j)=sqrt((4*a.*r(j))./(zeta2(i).^2+(a+r(j)).^2));
    end
end

[K1,E1]=ellipke(k1);
[K2,E2]=ellipke(k2);

C3=((2-k1.^2)./(2.*k1)).*K1-(E1./k1);
C4=((2-k2.^2)./(2.*k2)).*K2-(E2./k2);

Br=C1.*C2.*(C4-C3);
plot(4*Br(1,:)/(C1*pi),r/a)

end