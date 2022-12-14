%% Задание 1
% Задайте матрицу A с помощью операции конкатенации:
A = [3.25 -1.07 2.34; 10.10 0.25 -4.78; 5.04 -7.79 3.31]

%% Задание 2
% Сгенерируйте матрицу B размером 3 на 3 
% со случайными элементами от 0 до 1.
B = rand(3,3)

%% Задание 3
% Выполните действия: A+10*B, A*B, Bт. 
a = A+10*B
b = A*B
c = B'

%% Задание 4
% Вычислите определитель матрицы B
detB = det(B)

%% Задание 5
% Задайте массив C, используя операцию 
% индексации и одну из функций: 
% ones или zeros:
C = zeros(1,1);
C(2,1) = 5.71;
C(3,1) = -3.61

%% Задание 6
% Решите СЛАУ: A*X=C.
X = A\C

%% Задание 7
% Решите уравнение: 
syms x
D = [2*cos(x) 1; 1 2*sin(x)];
detD = det(D) == 0;
solve(detD)

%% Задание 8
% Решите системы с помощью формул Крамера:
% a)
A = [2 -1 -1; -1 2 1; 3 -5 -2];
B = [3; 0; 1];
A1 = A;
A1(:, 1) = B;
A2 = A;
A2(:, 2) = B;
A3 = A;
A3(:, 3) = B;
x1 = det(A1)/det(A)
x2 = det(A2)/det(A)
x3 = det(A3)/det(A)

% б)
A = [2 1 0; 1 0 3; 0 5 -1];
B = [5; 16; 10];
A1 = A;
A1(:, 1) = B;
A2 = A;
A2(:, 2) = B;
A3 = A;
A3(:, 3) = B;
x1 = det(A1)/det(A)
x2 = det(A2)/det(A)
x3 = det(A3)/det(A)
%% Задание 9
% Решите систему методом Гаусса:
A = [1 1 1; 1 3 1; 1 1 3];
B = [2; 4; 0];
C = [A B];
D = rref(C);
x = D(:, 4)

%% Задание 10
% Выполните действия:
% (3B)^2 - 2(BA^-1 - E)T
A = [0 -2; 1 -3];
B = [5 1; -1 0];
E = eye(2);
Aminus1 = A\E;
result = (3*B)^2 - 2*(B*Aminus1 - E)'

%% Задание 11
% Решите СЛАУ Ax=b методом LU-разложения и сделайте проверку:
A = [3.81 0.28 1.28 0.75; 2.25 1.32 4.58 0.49; 5.31 6.38 0.98 1.04; 9.39 2.45 3.35 2.28];
b = [1; 1; 1; 1];
[L,U] = lu(A);
x = U\(L\b)
% проверка
check = A * x
%% Задание 12
% Создайте 10х9 матрицу случайных элементов 
% в диапазоне значений 0, 1 и присвойте 
% переменной x значение элемента матрицы, 
% находящегося на пересечении последней строки 
% и предпоследнего столбца 
% (без знания того, что матрица 10 на 9).
M = rand(10,9);
x = M(end, end - 1)

%% Задание 13
% Решите систему линейных уравнений: 
A = [1 -1 3; 2 1 -4; 3 1 -3];
b = [8; -4; 1];
x = A\b
