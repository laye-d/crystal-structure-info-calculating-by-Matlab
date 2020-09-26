%晶面间距计算函数
function d = CalDSpacing(h,k,l,a,b,c,alpha,beta,gamma)
A = h/a*det([h/a,cos(gamma),cos(beta);k/b,1,cos(alpha);l/c,cos(alpha),1]);
B = k/b*det([1,h/a,cos(beta);cos(gamma),k/b,cos(alpha);cos(beta),l/c,1]);
C = l/c*det([1,cos(gamma),h/a;cos(gamma),1,k/b;cos(beta),cos(alpha),l/c]);
D = det([1,cos(gamma),cos(beta);cos(gamma),1,cos(alpha);cos(beta),cos(alpha),1]);
d = (D/(A+B+C))^(0.5);
end
