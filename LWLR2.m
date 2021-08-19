%% 这个代码编写的是局部加权线性回归的相关代码
clear all;
close all;
clc;
%% ======生成数据========
x=(1:0.1:10)';
y=x.^3+x+3 +rand(length(x),1)*6;
plot(x,y,'.')
%% ========================
sigma=0.2; %设置局部窗口，越大越使用全局数据，越小越使用局部数据
W=zeros(length(x));%窗口
C=[];
for i=1:length(x)

    for j=1:length(x) %1:length(x) 

         W(j,j)=exp(-((x(i)-x(j))^2)/(2*sigma^2)); %权重矩阵

    end

%     XX=[x.^2 x ones(length(x),1)];%这里与前面的线性模型不同的是将数据的0次，1次，2次做线性组合，用分段二次函数做近似
    XX=[ones(length(x),1) x x.^2]; %方式2

    YY=y;

    C=[C inv(XX'*W*XX)*XX'*W*YY]; %加权最小二乘，计算求得局部线性函数的系数,每次迭代都计算出一组系数

end

re=diag(XX*C);%获取对角线元素（正好就是分段线性出来的结果）

hold on;

plot(x,re);
