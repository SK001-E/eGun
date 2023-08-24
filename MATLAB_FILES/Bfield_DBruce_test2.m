function Bfield_DBruce_test2(mu,N,I,L,a11,a21)


a1=a11;
a2=a21;

a22=(a1+1:1:a2);

b=L/2;
alpha=a22./a1;
beta=b./a1;

F=(4*pi.*(beta./10)).*(asinh(alpha./beta)- asinh(1./beta));
B2=(N*I./a1).*(1./(2.*beta.*(alpha-1))).*F;

resB=abs(B2(1)-B2(2));

plot(a22,B2)
axis([a1 a2 min(B2)-resB max(B2)+resB])
xlabel('Outer radius (mm)'); ylabel('Magnetic field (mT)')
title('Variation of Magnetic field as outer radius varies')

end