function Bfield(mu,n,i,L,a)

%This is from Callaghan paper, NASA technical notes
%https://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/
%19980227402.pdf
%Radial Magnetic field along the axis of the solenoid

%typical values are 
%mu=1.25x10-6 SI; n=1000 turns; i= 2 A; L=25 mm; a= 4 in
%Bfield(1.25e-6,1000,2,25e-3,10e-2)

clc;
r=linspace(0.01,a,100);
z=linspace(-2*L,2*L,1000);
C1=(mu*n*i)/(pi*L);
C2=(a./r).^(1/2);

zeta1=z+(L/2);
zeta2=z-(L/2);

for i=1:length(z)
    for j=1:length(r)
k1(i,j)=(4*a.*r(j))./(zeta1(i).^2+(a+r(j)).^2);
k2(i,j)=(4*a.*r(j))./(zeta2(i).^2+(a+r(j)).^2);
    end
end

[K1,E1]=ellipke(k1);
[K2,E2]=ellipke(k2);

C3=((2-k1.^2)./(2.*k1)).*K1-(E1./k1);
C4=((2-k2.^2)./(2.*k2)).*K2-(E2./k2);

Br=C1.*C2.*(C3-C4);

plot(z*1000,Br(:,10).*1000)

end