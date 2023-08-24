function Bfield_DBruce_test1(mu,N,I,L,a11,a21)

%This is from D Bruce book, Solenoid and Magnet design
%B1= Eq 1.6 thin solenoid
%B2= Eq 1.12 thick solenoid
%Test for B2

%typical values are 
%mu=1.25x10-6 SI; N=1000 turns; i= 2 A; L=25 mm; a1 = 2 in
%a2 = 4 in
%the values of the radius are in mm
%Bfield_DBruce_test1(1.25e-6,1000,2,25e-3,50,100)

a1=a11;
a2=a21;

a12=(1:1:a2-1);

b=L/2;
alpha=a2./a12;
beta=b./a12;

F=(4*pi.*(beta./10)).*(asinh(alpha./beta)- asinh(1./beta));
B2=(mu*N*I./a12).*(1./(2.*beta.*(alpha-1))).*F;

resB=abs(B2(1)-B2(2));

plot(a12,B2)
axis([0 a2 min(B2)-resB max(B2)+resB]);
xlabel('Inner radius (mm)'); ylabel('Magnetic field (mT)')
title('Variation of Magnetic field as inner radius varies')

end