a = 0.4590368628020097;
b = 0.4590368628020097;
c = 0.4590368628020097;
alpha = 106.27081890129986/90*pi/2;
beta = 106.27081890129986/90*pi/2;
gamma = 106.27081890129986/90*pi/2;

h_range = -5:1:5;
k_range = -5:1:5;
l_range = -5:1:5;

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

csvwrite('R_paper_rhomb.csv',d_all);%保存csv