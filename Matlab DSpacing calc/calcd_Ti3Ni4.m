a = 1.124;
b = 1.124;
c = 0.5077;
alpha = 90/90*pi/2;
beta = 90/90*pi/2;
gamma = 120/90*pi/2;

h_range = 0:1:5;
k_range = 0:1:5;
l_range = 0:1:5;

d_all = [];
i = 1;

for h = h_range
    for k = k_range
        for l = l_range
            d_all(i,1) = h;
            d_all(i,2) = k;
            d_all(i,3) = l;
            d_all(i,4) = CalDSpacing(h,k,l,a,b,c,alpha,beta,gamma);%晶面间距
            d_all(i,5) = d_all(i,4)^(-1);%晶面间距倒数
            i = i+1;
        end
    end
end

csvwrite('Ti3Ni4.csv',d_all);%保存csv

