function Callaghan(mu,N,I,L,a11,a21)

%This is from paper by Callaghan, NASA technical reports
%B1= Eq 1.6 thin solenoid
%B2= Eq 1.12 thick solenoid
%Test for B2, field along the axis of a thick solenoid

%typical values are 
%mu=1.25x10-6 SI; N=1000 turns; i= 2 A; L=25 mm; a1 = 2 in
%a2 = 4 in
%Bfield_DBruce_z(1.25e-6,1000,2,25e-3,5e-2,10e-2)

a1=a11;
a2=a21;

b=L/2;
alpha=a2/a1;
beta=b/a1;

I1=(N*I)/(2*b);
z= linspace(0.5,2,5);

for i=1:length(z)

F0=(4*pi*beta/10)*(asinh(alpha/beta)-asinh(1/beta));
F1=(4*pi*beta/10)*(asinh(alpha/(beta+z(i)/a1))-asinh(1/(beta+z(i)/a1)));
if (z(i)/a1)<beta
    F2=(4*pi*beta/10)*(asinh(alpha/(beta-z(i)/a1))-asinh(1/(beta-z(i)/a1)));
else
    F2=-(4*pi*beta/10)*(asinh(alpha/(z(i)/a1-beta))-asinh(1/(z(i)/a1-beta)));
end
B1(i)=(mu*N*I/a1)*(1/(2*beta*(alpha-1)))*F0;

B2(i)=B1(i)*((F1+F2)/2*F0);
end

disp(B2*1000);
plot(i,B2*1000)

end