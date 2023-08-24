function Bfield_newbook(mu1,N,I,L,a1,a2)

%This is from the book : Magnetism - materials & applications
%magnetic field on the axis of a thick solenoid

%typical values are 
%mu1=1 SI; N=1000 turns; i= 2 A; L=25 mm; a2 = 51 mm 
%a1 = 30 mm
%Bfield_newbook(1,1000,2,25e-3,30,51)


mu = mu1*1.2566e-6;

z = -40:1:100;
a = a2/a1;
b = L/(2*a1);
c = z./a1;

A1 = (mu*I*a1)/2;

A2 = (b+c).*log((a+(a^2+(b+c).^2)).^0.5./(1+(1+(c-b).^2)).^0.5);
A3 = (c-b).*log((a+(a^2+(b+c).^2)).^0.5./(1+(1+(c-b).^2)).^0.5);

B2 = A1.*(A2-A3)*1e6;

resB2=abs(B2(1)-B2(2));
resz=abs(z(1)-z(2));

plot(z,B2)
axis([min(z)-resz max(z)+resz min(B2)-resB2 max(B2)+resB2])
xlabel('Axial distance (mm)'); ylabel('Magnetic field (mT)')
title('Axial magnetic field as a function of distance on the axis of the coil')

end