function Bfield_inte(mu,n,i,L,a)
%Magnetic field calculations by integration
%Magnetic field of a thin solenoid

%typical values are 
%mu1=1.25e-6 SI; N=1000 turns; i= 2 A; L=25 mm; a = 51 mm 

%Bfield_inte(1.25e-6,1000,2,25e-3,51)

clc;
syms theta
r=linspace(0.01,3*a,10);
z=0.2*L/2;
C1=(a*mu*n*i)/(2*pi);

zeta1=z+(L/2);
zeta2=z-(L/2);


    for j=1:length(r)
        zeta1r=((zeta1^2)+((r(j))^2)+(a^2)-(2*a*r(j)*cos((theta))))^(1/2);
        zeta2r=((zeta2^2)+((r(j))^2)+(a^2)-(2*a*r(j)*cos((theta))))^(1/2);
        
        f=cos(theta)*(1/zeta1r-1/zeta2r);
        Br(j)=-C1*int(f,theta,[0 pi]);
    end

%plot(4*Br/(mu*n*i),r/a)
plot(r,Br)

end