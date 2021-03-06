%% -====这里对二次函数进行耦合，原来的目标表达式为x^2+x+1
x = [0;1;2];
b = [1;3;7];
% A = [ones(size(x)) x x.^2]; %方式一
A = [x.^2 x ones(size(x))]; %方式二
result = inv(A'*A)*A'*b; %公用部分
% y = result(1) +result(2)*x +result(3)*(x.^2); %方式一
y = result(3) +result(2)*x +result(1)*(x.^2); %方式二
%% ========
% A是系数矩阵，怎么给出来的呢，就直接用的一列1,一列自变量，一列自变量的平方然后做回归出来的,至于说方式1，方式2，求出来的结果是一样的
%% ========