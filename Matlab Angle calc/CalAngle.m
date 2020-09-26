%晶面夹角计算函数
function Phi = CalAngle(h1,k1,l1,h2,k2,l2,a,b,c,alpha,beta,gamma)
d1=CalDSpacing(h1,k1,l1,a,b,c,alpha,beta,gamma);%晶面间距
d2=CalDSpacing(h2,k2,l2,a,b,c,alpha,beta,gamma);%晶面间距
VV=(a*b*c)^2*(1-(cos(alpha))^2-(cos(beta))^2-(cos(gamma))^2 + 2*cos(alpha)*cos(beta)*cos(gamma));
S11=b^2*c^2*(sin(alpha))^2;
S22=a^2*c^2*(sin(beta))^2;
S33=a^2*b^2*(sin(gamma))^2;
S12=a*b*c^2*(cos(alpha)*cos(beta)-cos(gamma));
S23=a^2*b*c*(cos(gamma)*cos(beta)-cos(alpha));
S13=a*b^2*c*(cos(gamma)*cos(alpha)-cos(beta));
%单斜晶面夹角计算
%cosPhi = d1*d2*(sin(beta))^2*(h1*h2/(a^2)+k1*k2*(sin(beta))^2/(b^2)+l1*l2/(c^2)-(l1*h2+l2*h1)*cos(beta)/(a*c));
%三斜晶面夹角计算
cosPhi = d1*d2/VV*(S11*h1*h2+S22*k1*k2+S33*l1*l2+S23*(k1*l2+k2*l1)+S13*(l1*h2+l2*h1)+S12*(h1*k2+h2*k1));
Phi = acos(cosPhi)/pi*180;
end
