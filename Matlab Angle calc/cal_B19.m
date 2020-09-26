%两晶面族间可能的晶面夹角穷举计算程序
% ！接受晶面夹角计算结果前应确认输出的d_PlanesFamily1和d_PlanesFamily2值是否与pdf卡片晶面间距值一致！若不一致应调整PlanesFamily1或PlanesFamily2指数数字排列！

clear;
%%%%%%%%%%%%%%%%%%%%%%%
%晶体结构信息
name="B19'";
a=4.622;
b=4.120;
c=2.885;
alpha=90/90*pi/2;
beta=96.8/90*pi/2;
gamma=90/90*pi/2;
%待计算晶面族
PlanesFamily1 = [1,1,0];%晶面族1
PlanesFamily2 = [-1,1,1];%晶面族1
%%%%%%%%%%%%%%%%%%%%%%%

%穷举晶面族可能含有的晶面
mat_temp_1=perms(PlanesFamily1);%元素排列
mat_temp_2=perms(PlanesFamily2);%元素排列
mat_temp_1 = unique(mat_temp_1,'rows');%删除重复行
mat_temp_2 = unique(mat_temp_2,'rows');%删除重复行
mat_hkl_1=[];
mat_hkl_2=[];
for aa = -1:2:1
    for bb = -1:2:1
        for cc = -1:2:1
            mat_hkl_1=[ mat_hkl_1; mat_temp_1.*[aa,bb,cc] ];%族1所有晶面
            mat_hkl_2=[ mat_hkl_2; mat_temp_2.*[aa,bb,cc] ];%族2所有晶面
        end
    end
end
mat_hkl_1 = unique(mat_hkl_1,'rows');%删除重复行
mat_hkl_2 = unique(mat_hkl_2,'rows');%删除重复行

%根据晶面间距，剔除非该晶面族的晶面。（e.g.对于非立方结构）
d_PlanesFamily1 = CalDSpacing(PlanesFamily1(1,1),PlanesFamily1(1,2),PlanesFamily1(1,3),a,b,c,alpha,beta,gamma)%族1对应晶面间距
d_PlanesFamily2 = CalDSpacing(PlanesFamily2(1,1),PlanesFamily2(1,2),PlanesFamily2(1,3),a,b,c,alpha,beta,gamma)%族2对应晶面间距
i=1;
while i <= size(mat_hkl_1,1)%行数
    if CalDSpacing(mat_hkl_1(i,1),mat_hkl_1(i,2),mat_hkl_1(i,3),a,b,c,alpha,beta,gamma) ~= d_PlanesFamily1
        mat_hkl_1(i,:) = [];
        i=i-1;
    end
    i=i+1;
end
i=1;
while i <= size(mat_hkl_2,1)%行数
    if CalDSpacing(mat_hkl_2(i,1),mat_hkl_2(i,2),mat_hkl_2(i,3),a,b,c,alpha,beta,gamma) ~= d_PlanesFamily2
        mat_hkl_2(i,:) = [];
        i=i-1;
    end
    i=i+1;
end

%计算晶面夹角
ii=0;
for i = 1:size(mat_hkl_1,1)%行数
    for j = 1:size(mat_hkl_2,1)%行数
        h1 = mat_hkl_1(i,1);
        k1 = mat_hkl_1(i,2);
        l1 = mat_hkl_1(i,3);
        h2 = mat_hkl_2(j,1);
        k2 = mat_hkl_2(j,2);
        l2 = mat_hkl_2(j,3);
        ii=ii+1;
        angle_all(ii,1) = h1;
        angle_all(ii,2) = k1;
        angle_all(ii,3) = l1;
        angle_all(ii,4) = h2;
        angle_all(ii,5) = k2;
        angle_all(ii,6) = l2;
        angle_all(ii,7) = CalAngle(h1,k1,l1,h2,k2,l2,a,b,c,alpha,beta,gamma);
    end
end

%保存csv
csvwrite(strcat(name,"_[",num2str(PlanesFamily1),']-[',num2str(PlanesFamily2),'].csv'),angle_all);
