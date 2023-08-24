function Bfield_DBruce(mu,N,I,L,a21,a11)

%This is from D Bruce book, Solenoid and Magnet design
%B1= Eq 1.6 thin solenoid
%B2= Eq 1.12 thick solenoid
%Magnetic field along the axis of the solenoid

%typical values are 
%mu=1.25x10-6 SI; N=1000 turns; i= 2 A; L=25 mm; a1 = 2 in
%a2 = 4 in
%Bfield_DBruce(1.25e-6,1000,2,25e-3,51e-3,30e-3)

a1=a11;
a2=a21;

b=L/2;
alpha=a2/a1;
beta=b/a1;

I1=(N*I)/(2*b);
B1=((mu*4*pi*I1)/10)*(beta/(1+beta^2))^(1/2);

F=(4*pi*beta/10)*(asinh(alpha/beta)-asinh(1/beta));
B2=(mu*N*I/a1)*(1/(2*beta*(alpha-1)))*F;

disp(B1*1000); disp(B2*1000);

end