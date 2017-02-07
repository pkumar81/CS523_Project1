function [eigenvalue1, eigenvalue2]=eigenvalue(F, F_Jacobian, t_max, rho_range,gammar, x0, y0)
 eigenvalue1=[];
 eigenvalue2=[];

 
xy = [x0; y0]; 
for rho=rho_range
    
for i=1:t_max
J = F_Jacobian(xy, rho, gammar); 
xy=F(xy, rho, gammar);
end

temp=eig(J);
 eigenvalue1=[eigenvalue1,temp(1,1)];
 eigenvalue2=[eigenvalue2,temp(2,1)];

end

end




