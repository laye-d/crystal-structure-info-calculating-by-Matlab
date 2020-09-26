%�����������ܵľ���н���ټ������
% �����ܾ���нǼ�����ǰӦȷ�������d_PlanesFamily1��d_PlanesFamily2ֵ�Ƿ���pdf��Ƭ������ֵһ�£�����һ��Ӧ����PlanesFamily1��PlanesFamily2ָ���������У�

clear;
%%%%%%%%%%%%%%%%%%%%%%%
%����ṹ��Ϣ
name="B19'";
a=4.622;
b=4.120;
c=2.885;
alpha=90/90*pi/2;
beta=96.8/90*pi/2;
gamma=90/90*pi/2;
%�����㾧����
PlanesFamily1 = [1,1,0];%������1
PlanesFamily2 = [-1,1,1];%������1
%%%%%%%%%%%%%%%%%%%%%%%

%��پ�������ܺ��еľ���
mat_temp_1=perms(PlanesFamily1);%Ԫ������
mat_temp_2=perms(PlanesFamily2);%Ԫ������
mat_temp_1 = unique(mat_temp_1,'rows');%ɾ���ظ���
mat_temp_2 = unique(mat_temp_2,'rows');%ɾ���ظ���
mat_hkl_1=[];
mat_hkl_2=[];
for aa = -1:2:1
    for bb = -1:2:1
        for cc = -1:2:1
            mat_hkl_1=[ mat_hkl_1; mat_temp_1.*[aa,bb,cc] ];%��1���о���
            mat_hkl_2=[ mat_hkl_2; mat_temp_2.*[aa,bb,cc] ];%��2���о���
        end
    end
end
mat_hkl_1 = unique(mat_hkl_1,'rows');%ɾ���ظ���
mat_hkl_2 = unique(mat_hkl_2,'rows');%ɾ���ظ���

%���ݾ����࣬�޳��Ǹþ�����ľ��档��e.g.���ڷ������ṹ��
d_PlanesFamily1 = CalDSpacing(PlanesFamily1(1,1),PlanesFamily1(1,2),PlanesFamily1(1,3),a,b,c,alpha,beta,gamma)%��1��Ӧ������
d_PlanesFamily2 = CalDSpacing(PlanesFamily2(1,1),PlanesFamily2(1,2),PlanesFamily2(1,3),a,b,c,alpha,beta,gamma)%��2��Ӧ������
i=1;
while i <= size(mat_hkl_1,1)%����
    if CalDSpacing(mat_hkl_1(i,1),mat_hkl_1(i,2),mat_hkl_1(i,3),a,b,c,alpha,beta,gamma) ~= d_PlanesFamily1
        mat_hkl_1(i,:) = [];
        i=i-1;
    end
    i=i+1;
end
i=1;
while i <= size(mat_hkl_2,1)%����
    if CalDSpacing(mat_hkl_2(i,1),mat_hkl_2(i,2),mat_hkl_2(i,3),a,b,c,alpha,beta,gamma) ~= d_PlanesFamily2
        mat_hkl_2(i,:) = [];
        i=i-1;
    end
    i=i+1;
end

%���㾧��н�
ii=0;
for i = 1:size(mat_hkl_1,1)%����
    for j = 1:size(mat_hkl_2,1)%����
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

%����csv
csvwrite(strcat(name,"_[",num2str(PlanesFamily1),']-[',num2str(PlanesFamily2),'].csv'),angle_all);
