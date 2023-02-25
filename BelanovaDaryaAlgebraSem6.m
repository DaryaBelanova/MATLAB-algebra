%% Задание 1
% Напишите скрипт, переставляющий элементы 
% вектора в обратном  порядке и записывающий 
% результат в новый вектор.
disp("Задание 1")
example1 = [1 2 3 4 5]
res = fliplr(example1)

%% Задание 2
% Напишите скрипт, выделяющий из вектора 
% 2 новых вектора, содержащие чётные 
% (первый вектор) и нечётные (второй)
% элементы исходного вектора. 
disp("Задание 2")
example2 = [1 2 3 4 5 6]
odd = example2(1:2:length(example2))
even = example2(2:2:length(example2))

%% Задание 3
% Создайте скрипт, находящий сумму отрицательных элементов вектора.
disp("Задание 3")
a = input("Введите вектор, не забудьте про []: ")
sum(a(a<0))

%% Задание 4
% Создайте скрипт, заменяющий элементы 
% вектора, отличающиеся от среднего 
% геометрического его элементов более, 
% чем на 30%, на это среднее геометрическое.
disp("Задание 4")
example4 = [2 1 10 4 1]
geom = geomean(example4)
geom_plus30 = 1.3*geom
geom_minus30 = 0.7*geom
example4(example4>geom_plus30) = geom;
example4(example4<geom_minus30) = geom

%% Задание 5
% Напишите скрипт, заменяющий все минимальные по значению 
% элементы вектора максимальным значением его элементов.
disp("Задание 5")
example5 = [-23 58 30 100 65 -23 28]
all_min = find(example5 == min(example5))
example5(all_min) = max(example5)
%% Задарние 6
% Разработайте скрипт, ищущий и выводящий число положительных, 
% нулевых и отрицательных элементов входной матрицы.
disp("Задание 6")
A=[1 -2 0; 3 4 0; -2 -3 2]
above_zero = length(A(A>0))
zero = length(A(A==0))
sub_zero = length(A(A<0))

%% Задание 7
% Решите систему уравнений 2x1+3x2+3x3=8; 4x1+2x2+3x3=7; 
% 6x1+5x2+6x3=7 методом x=A\b. Затем найдите число обусловленности 
% матрицы (функция cond(A)), убедитесь в неправильности найденного 
% решения (сделайте проверку) и решите систему методом Гаусса. 
disp("Задание 7");
A=[2 3 3; 4 2 3; 6 5 6];
b = [8;7;7];
x = A\b
cond(A)
if round(A*x)==b
    disp("Решение правильное")
else 
    disp("Решение неправильное")
end

C = [A b];
D = rref(C);
x = D(:,length(b)+1)

%% Задание 8
% Дана табличная функция y(t)=a*e^(-t)+b*t: t=[0 0.1 0.2 0.3 0.4 0.5], 
% y=[4.25 3.95 3.64 3.41 3.21 3.04] (т.е. переопределённая система 6 
% уравнений для 2 неизвестных: a и b). Решите эту систему с помощью \, 
% постройте графики функции: по точкам y(t) и линией (fplot) согласно 
% найденным a и b.  
disp("Задание 8")
[a, b] = fit

%% Задание 9 
% Решите недоопределённую систему уравнений 
% x1+2x2+3x3=2; 3x1+4x2+5x3=2 (\). Проверьте 
% решение, умножив матрицу системы (А) на него.
disp("Задание 9")
A = [1 2 3; 3 4 5]
b = [2; 2]
x = A\b
check = A * x

%% Задание 10
% Решите систему линейных уравнений 
% 2x1+3x2+3x3=8; -2x1-3x2-3x3=7 
% с помощью функции linsolve.
disp("Задание 10")
A = [2 3 3; -2 -3 -3]
b = [8; 7]
[x, r] = linsolve(A, b)

%% Задание 11
% Решите систему из п.10 с помощью 
% QR-разложения.

disp("Задание 11")
A = [2 3 3; -2 -3 -3]
b = [8;7]
[q,r] = qr(A)
x = r\(q'*b)

%% Задание 12
% Вычислите все собственные векторы 
% и числа матрицы A [2 4 5; 3 6 7; 8 5 2]. 
% Выведите их по очереди, записав в отдельные 
% векторы и переменные. Проверьте, правильно 
% ли найден первый собственный вектор и 
% соответствующее ему собственное число.
disp("Задание 12")
A = [2 4 5; 3 6 7; 8 5 2]
[x, y] = eig(A);
for i = 1:3
    sobstv_vector_i = x(:, i)
    sobstv_num_i = y(i,i)
end
disp("A * x(:, 1) = y(1, 1)*x(:, 1) ?")
ans = A * x(:, 1) - y(1, 1)*x(:, 1)

%% Функция для задания 8
function [a,b] = fit
    t = [0; 0.1; 0.2; 0.3; 0.4; 0.5]
    y = [4.25; 3.95; 3.64; 3.41; 3.21; 3.04];
    A = [exp(-t) t]
    x = A\y;
    a = x(1);
    b = x(2);
    figure("Name","Задание 8", "NumberTitle","off")
    plot(t,y,'s');
    hold on;
    fplot(@(t) x(1).*exp(-t)+x(2).*t, [0 0.5])
end