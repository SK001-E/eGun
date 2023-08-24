function [Bz] = Bzfield(mu,n,I,L,a)

clc;
syms theta
r=linspace(0.01,3*a,200);
z=linspace(1.5)*L/2;
C1=(a*mu*n*I)/(2*pi);

zeta1=z+(L/2);
zeta2=z-(L/2);

Bz=zeros(length(z), length(r));
savefile='Bzfield.mat';
for i=1:length(z)
    for j=1:length(r)
        C2=(r(j)^2+a^2-2*a*r(j)*cos(theta));
        C3=(a-r(j)*cos(theta));
        
        zeta1r=(zeta1(i)^2+r(j)^2+a^2-2*a*r(j)*cos(theta))^(1/2);
        zeta2r=(zeta2(i)^2+r(j)^2+a^2-2*a*r(j)*cos(theta))^(1/2);
        
        f1=(zeta1(i)*C3)/(C2*zeta1r);
        f2=(zeta2(i)*C3)/(C2*zeta2r);
        
        Bz1(i,j)=C1*int(f1,theta,[0 pi]);
        Bz2(i,j)=C1*int(f2,theta,[0 pi]);
        
        Bz(i,j)=Bz1(i,j)-Bz2(i,j);
        writematrix(Bz,'test.dat');
        M=[i j]; disp(M)
    end
end

% plot(4*Bz/(mu*n*I),r/a)
 plot(r,Bz)

end