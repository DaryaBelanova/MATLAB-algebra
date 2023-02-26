%% Задание 1
% Решите систему методом 
% сингулярного разложения:
% |x1 + x2 + x3 = 2
% |x1 + 3x2 + x3 = 4
% |x1 + x2 + 3x3 = 0
disp("Задание 1");
A = [1 1 1; 1 3 1; 1 1 3]
b = [2; 4; 0]
[U,S,V] = svd(A)
x = U*(S^(-1))*V'*b

%% Задание 2
% Решите систему из п. 1 
% методом разложения Холецкого. 
disp("Задание 2")
A = [1 1 1; 1 3 1; 1 1 3]
b = [2; 4; 0]
R = chol(A)
y = R' \ b
x = R \ y
%% Задание 3
% Напишите алгоритм итерационного 
% метода Ричардсона 
% (см. источник 1, стр. 130, 
% или слайд 4) и решите с его помощью 
% систему из пункта 1.
disp("Задание 3")
A = [1 1 1; 1 3 1; 1 1 3];
b=[2;4;0];
tau = 0.1;
x=[0;0;0];
n=250;
%n=234
for i=1:n
    r=b-A*x;
    x=x+r*tau;
end
x
A*x

%% Задание 4
% Напишите алгоритм метода 
% простой итерации (см. стр. 132 
% источника 1 или слайды 5-6) и решите 
% с его помощью систему из пункта 1.
disp("Задание 4");
A = [1 1 1; 1 3 1; 1 1 3]
b = [2; 4; 0]
x0 = [0; 0; 0];
n = 2000;
eps = 0.0001;
for i = 1:length(b)
    for j = 1 : length(b)
        beta(i) = b(i)/A(i,i);
        if (i == j)
            newa(i,j) = 0;
        else
            newa(i,j) = -A(i,j)/A(i,i);
        end
    end
end
x1 = x0;
ncount = beta';
while(true)
    ncoun = ncount + 1;
    x1 = beta + newa*x0;
    max = abs(x0(1)-x1(1));
    for i = 2:length(x0)
        if (abs(x0(i)-x1(i)) > max)
            max = abs(x0(i)-x1(i));
        end
    end
    if (max < eps | ncount > n)
        x = x1;
        break
    else
        x0 = x1;
        break
    end
end
x

%% Задание 5
% Напишите алгоритм итерационного 
% метода Гаусса-Зейделя 
% (см. источник 1, стр. 135 или 
% слайды 7-8) и решите с его помощью 
% систему из пункта 1.
disp("Задание 5");
A = [1 1 1; 1 3 1; 1 1 3]
b = [2; 4; 0]
x0 = [0;0;0];
n=2000;
eps=0.0001;
F=A'*A;
H=A'*b;
for i = 1:length(b)
    for j=1:length(b)
        beta(i)=H(i)/F(i,i);
        if (i == j)
            newa(i,j)=0;
        else
            newa(i,j)=-F(i,j)/F(i,i);
        end
    end
end
x1=x0;
ncount=0;
beta=beta';
while(true)
    ncount = ncount+1;
    for i = 1:length(b)
        s=0;
        for j=1:length(b)
            s=s+newa(i,j)*x1(j);
        end
        x1(i) = beta(i)+s;
    end
    max=abs(x0(1)-x1(1));
    for i =2:length(x0)
        if (abs(x0(i)-x1(i)) > max)
            max = abs(x0(i)-x1(i));
        end
    end
    if (max<eps | ncount>n)
        x=x1;
        break
    else
        x0=x1;
        break
    end
end
x

%% Задание 6
% Напишите алгоритм итерационного метода 
% последовательной верхней релаксации (SOR) 
% (см. источник 1, стр. 136, или слайды 9-10)
% и решите с его помощью систему из пункта 1.
disp("Задание 6");
A = [1 1 1; 1 3 1; 1 1 3]
b = [2; 4; 0]
x0 = [0;0;0];
n=45;
eps=0.00001;
F=A'*A;
H=A'*b;
w=1.4;
for i=1:length(b)
    for j=2:length(b)
        beta(i)=H(i)/F(i,i);
        if (i==j)
            newa(i,j)=0;
        else
            newa(i,j)=-F(i,j)/F(i,i);
        end
    end
end
x1=x0;
ncount = 0;
beta=beta';
while(true)
    ncount=ncount+1;
    for i=1:length(b)
        s=0;
        for j=1:length(b)
            s=s+newa(i,j)*x1(j);
        end
        x1(i)=beta(i)+s+(w-1)*(beta(i)+s-x0(i));
    end
    max=abs(x0(1)-x1(1));
    for i=2:length(x0)
        if (abs(x0(i) - x1(i))>max)
            max=abs(x0(i) - x1(i));
        end
    end
    if (max<eps | ncount>n)
        x=x1;
        break
    else
        x0=x1;
        break
    end
end
x

%% Задание 7
% Напишите алгоритм итерационного метода 
% сопряжённых градиентов (см. источник 1, 
% стр. 181) и решите с его помощью систему 
% из пункта 1.
disp("Задание 7");
A = [1 1 1; 1 3 1; 1 1 3]
b = [2; 4; 0]
k = 0;
eps = 0.00001;
x0 = [0;0;0];
r0 = b - A*x0;
rprev = r0;
p1 = r0;
while(true)
    k = k+1;
    ak = dot(r0,r0)/dot(A*p1,p1);
    x0 = x0+ak*p1;
    rprev = r0;
    r0 = r0-ak*A*p1;
    if (abs(r0)/abs(b) < eps)
        break;
    end
    betak = dot(r0,r0)/dot(rprev, rprev);
    p1 = r0+betak*p1;
end
x