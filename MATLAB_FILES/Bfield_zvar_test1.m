function Bfield_zvar_test1(mu1,N,I,L,a21,a11)

%This is from a paper (page actually) provided by Dr Freelon
%Magnetic field of a thick solenoid

%typical values are 
%mu1=1 SI; N=1000 turns; i= 2 A; L=25 mm; a21 = 51 mm 
%a11 = 30 mm
%Bfield_zvar_test1(1,1000,2,25e-3,30,51)

mu=mu1*1.2566e-6;
a1=a11;
a2=a21;

z=-40:1:100;

A=(L/2)-z;
B=(L/2)+z;

A1=(mu*N*I)/(2*L*(a2-a1));

C11= a2+(a2^2+A.^2).^(1/2);
C12= a1+(a1^2+A.^2).^(1/2);
C21= a2+(a2^2+B.^2).^(1/2);
C22= a1+(a1^2+B.^2).^(1/2);

C1=A.*log(C11./C12);
C2=B.*log(C21./C22);

B2=A1.*(C1+C2)*1e6;

resB2=abs(B2(1)-B2(2));
resz=abs(z(1)-z(2));

plot(z,B2)
axis([min(z)-resz max(z)+resz min(B2)-resB2 max(B2)+resB2])
xlabel('Axial distance (mm)'); ylabel('Magnetic field (mT)')
title('Axial magnetic field as a function of distance on the axis of the coil')

end