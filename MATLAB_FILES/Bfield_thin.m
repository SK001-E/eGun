function Bfield_thin(mu1,N,I,a)

mu=mu1*1.2566e-6;

L=0:25:100;
R=a*25.4;
L1=1/2.*L;
x= -55:1:55;

for i=1:length(x)

    for j=1:length(L)

C1(i,j)= (mu*N*I)/(2*L(j));
C2(i,j)= (x(i)+L1(j))/((x(i)+L1(j))^2+R^2)^(1/2);
C3(i,j)= (x(i)-L1(j))/((x(i)-L1(j))^2+R^2)^(1/2);

B2(i,j)= C1(i,j)*(C2(i,j)-C3(i,j))*1e6;

    end
end

resB=abs(B2(1,1)-B2(1,2));
%resz=abs(z(1)-z(2));

plot(x,B2)
xlabel('Axial distance (mm)'); ylabel('Magnetic field (mT)');
title('Axial magnetic field due to a thin solenoid')
legend('1','2','3','4')
axis([-max(L) -max(L) min(B2)-resB max(B2)+resB]);

end