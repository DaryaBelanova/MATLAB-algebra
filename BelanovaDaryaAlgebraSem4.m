%% ДЗ к семинару 4 по алгебре Matlab

%% Задание 1
% Проверьте свойства суммы векторов (источник [1], стр. 7),      
% используя векторы a=(2;3;4), b=(3;5;2), c=(1;1;1): 
% сначала непосредственно (сумма 1 == сумма 2), 
% затем используя функцию isequal( , ). 
% Сделайте геометрическую интерпретацию.
a = [2, 3, 4];
b = [3, 5, 2];
c = [1, 1, 1];
disp("коммутативное свойство через == : a+b=b+a")
a + b == b + a
disp("коммутативное свойство через isequal : a+b=b+a")
isequal(a + b, b + a)
disp("ассоциативное свойство через == : (a+b)+c=a+(b+c)")
a + b + c == a + (b + c)
disp("ассоциативное свойство через isequal : (a+b)+c=a+(b+c)")
isequal(a + b + c, a + (b + c))

figure("Name", "Задание 1.1");
title("Задание 1.1");
grid on;
hold on;
quiver3(0,0,0,2,3,4,1,'LineWidth',3,"Color","b");
quiver3(2,3,4,3,5,2,1,'LineWidth',3,"Color","g");
quiver3(0,0,0,3+2,5+3,2+4,1,'LineWidth',3,"Color","k");
quiver3(0,0,0,3,5,2,1,'LineWidth',3,"Color","g");
quiver3(3,5,2,2,3,4,1,'LineWidth',3,"Color","b");
axis equal;
axis([0 5.5 0 8.5 0 6.5]);
xlabel("X");
ylabel("Y");
zlabel("Z");
text(2, 3, 4.25,"a");
text(3+2,5+3,2+4 + 0.25,"b");
text(3+2,5+3 + 0.25,2+4,"a+b");
text(3, 5, 2.25,"b");
text(2+3,3+5,4+2 - 0.25,"a");
text(1,2,5,"\bfa + b = b + a", "LineWidth", 4);
view(50,-1)

figure("Name", "Задание 1.2");
title("Задание 1.2");
grid on;
hold on;
quiver3(0,0,0,2,3,4,1,'LineWidth',3,"Color","b");
quiver3(2,3,4,3,5,2,1,'LineWidth',3,"Color","g");
quiver3(2+3,3+5,4+2,1,1,1,1,'LineWidth',3,"Color","r");
quiver3(0,0,0,3+2+1,5+3+1,2+4+1,1,'LineWidth',3,"Color","k");

quiver3(0,0,0,3,5,2,1,'LineWidth',3,"Color","g");
quiver3(3,5,2,2+1,3+1,4+1,1,'LineWidth',3,"Color","magenta");
axis equal;
axis([0 6.5 0 9.5 0 7.5]);
xlabel("X");
ylabel("Y");
zlabel("Z");
text(2, 3, 4.25,"a");
text(3+2,5+3,2+4 + 0.25,"b");
text(3+2+1,5+3+1 + 0.25,2+4+1,"c");
text(3+2+1,5+3+1 - 0.25,2+4+1,"a+b+c");
text(3+2+1,5+3+1 + 0.25,2+4+1 - 0.5,"b+c");
text(5,4,6,"\bf(a + b) + c = a + (b + c)");
view(-94,2)

%% Задание 2
% Проверьте свойства умножения вектора на число 
% (1,2,3 согласно источнику [1], стр. 29) 
% на следующих векторах: a=(4,2,3), b=(1,5,2) 
% и числах: α=4, β=3. Используйте isequal.
a = [4,2,3];
b = [1,5,2];
alpha = 4;
beta = 3;
disp("дистрибутивное свойство: α(a+b)=αa+αb")
isequal(alpha * (a + b), alpha*a + alpha*b)
disp("дистрибутивное свойство: (α+β)a=αa+βa")
isequal((alpha + beta) * a, alpha*a + beta*a)
disp("ассоциативное свойство: α(βa)=(αβ)a")
isequal(alpha * (beta*a), (alpha*beta)*a)

%% Задание 3
% Длину вектора  a = {3, 4, 5} вычислите по 
% определению ([1], стр. 30) и с помощью 
% встроенной функции norm(). Вычислите орт 
% а0 (найдите его координаты). Проверьте, 
% является ли вычисленный вектор единичным 
% (isequal). Изобразите оба вектора. 
% Сделайте то же самое для вектора b = {4, 2}.
figure("Name", "Задание 3");
title("Задание 3");

a = [3,4,5];
disp("длина вектора по определению:")
length1 = sqrt(sum(a.^2))
disp("длина вектора с помощью norm():")
length2 = norm(a)
a0 = a / length1
disp("a0 - единичный? :")
isequal(1, norm(a0))
subplot(1,2,1);
grid on;
hold on;
quiver3(0,0,0,3,4,5,1,'LineWidth',3,"Color","g");
quiver3(0,0,0,a0(1),a0(2),a0(3),1,'LineWidth',3,"Color","b");
axis equal;
axis([0 3.5 0 5 0 5.5]);
xlabel("X");
ylabel("Y");
zlabel("Z");
text(3,4,5, "a");
text(a0(1),a0(2),a0(3), "a0");
view(43,6)

b = [4,2];
disp("длина вектора по определению:")
lengthB1 = sqrt(sum(b.^2))
disp("длина вектора с помощью norm():")
lengthB2 = norm(b)
b0 = b / lengthB1
disp("b0 - единичный? :")
isequal(1, norm(b0))
subplot(1,2,2);
grid on;
hold on;
quiver(0,0,4,2,1,'LineWidth',3,"Color","g");
quiver(0,0,b0(1),b0(2),1,'LineWidth',3,"Color","b");
axis equal;
axis([0 4.5 0 3]);
xlabel("X");
ylabel("Y");
text(4,2, "b");
text(b0(1),b0(2), "b0");

%% Задание 4
% Вычислите в градусах углы наклона вектора 
% a = {3, 4, 5} к осям координат. Проверьте, 
% что сумма квадратов направляющих косинусов 
% вектора будет равна единице. Сделайте то же 
% самое для вектора b = {4, 2}.
a = [3,4,5];
disp("косинусы к осям координат: ")
cosA = a ./ norm(a)
disp("сумма квадратов напрвлющих косинусов: ")
summaA = sum(cosA.^2)
disp("углы в градусах: ")
anglesA = acosd(cosA)

b = [4,2];
disp("косинусы к осям координат: ")
cosB = b ./ norm(b)
disp("сумма квадратов напрвлющих косинусов: ")
summaB = sum(cosB.^2)
disp("углы в градусах: ")
anglesB = acosd(cosB)

%% Задание 5
% Векторы a = {1, -2, 0}, b = {0, 1, 1} 
% и c = {1, 2, 2} образуют базис (покажите, 
% что векторы некомпланарны). Изобразите эти 
% векторы с помощью функций line и plot3. 
% Изобразите координатные орты  черным цветом, 
% толщиной ‘LineWidth’, 4. Вычислите и изобразите 
% орты векторов  толщиной ‘LineWidth’, 4.
figure("Name", "Задание 5");
title("Задание 5");
grid on;
hold on;
a = [1,-2,0];
b = [0,1,1];
c = [1,2,2];
disp("a, b, c не компланарны, т.к. их смешанное произведение равно: ")
dot_cross = dot(cross(a,b),c)
line([0,0,0; a(1),b(1),c(1)], [0,0,0; a(2),b(2),c(2)], [0,0,0; a(3),b(3),c(3)])
plot3(a(1),a(2),a(3),'>')
plot3(b(1),b(2),b(3),'>')
plot3(c(1),c(2),c(3),'>')
text(a(1), a(2), a(3)+0.25,"a")
text(b(1), b(2), b(3)+0.25,"b")
text(c(1), c(2), c(3)+0.25,"c")

line([0,0,0; 1,0,0], [0,0,0; 0,1,0], [0,0,0; 0,0,1], 'LineWidth', 4, 'Color', 'k')
plot3(1,0,0,'>', 'LineWidth', 4, 'Color', 'k')
plot3(0,1,0,'>', 'LineWidth', 4, 'Color', 'k')
plot3(0,0,1,'>', 'LineWidth', 4, 'Color', 'k')
text(1, 0, 0+0.25,"i")
text(0, 1, 0+0.25,"j")
text(0, 0, 1+0.25,"k")

ortA = a / norm(a)
ortB = b / norm(b)
ortC = c / norm(c)
line([0,0,0; ortA(1),ortB(1),ortC(1)], [0,0,0; ortA(2),ortB(2),ortC(2)], [0,0,0; ortA(3),ortB(3),ortC(3)], 'LineWidth', 4)
plot3(ortA(1),ortA(2),ortA(3),'>', 'LineWidth', 4)
plot3(ortB(1),ortB(2),ortB(3),'>', 'LineWidth', 4)
plot3(ortC(1),ortC(2),ortC(3),'>', 'LineWidth', 4)
text(ortA(1), ortA(2), ortA(3)+0.25,"ort a")
text(ortB(1), ortB(2), ortB(3)+0.25,"ort b")
text(ortC(1), ortC(2), ortC(3)+0.25,"ort c")

axis equal;
axis([0 1.5 -2.5 2.5 0 2.5]);
xlabel("X");
ylabel("Y");
zlabel("Z");
view(49,20)

%% Задание 6
% Векторы  p = {2,-3}  и  q = {1,2} 
% образуют базис (покажите, что векторы 
% неколлинеарны).  Найдите разложение 
% вектора s = {9,4}  по базису p и q: 
% s =mp + nq. Изобразите  векторы p, q , 
% mp, nq, s,  а также координатные оси Ox и Oy 
% и координатные орты i, j.
figure("Name", "Задание 6", "NumberTitle","off");
title("Задание 5");
grid on;
hold on;
p = [2,-3];
q = [1,2];
p3 = [2,-3,0];
q3 = [1,2,0];
disp("p, q не коллинеарны, т.к. их векторное произведение не равно 0: ")
cross_p3q3 = cross(p3,q3)
s = [9,4];
opr = det(horzcat(p', q'));
opr1 = det(horzcat(s', q'));
opr2 = det(horzcat(p', s'));
m = opr1 / opr;
n = opr2 / opr;
mp = m * p
nq = n * q

quiver(0, 0, mp(1), mp(2), 1)
quiver(0, 0, nq(1), nq(2), 1)
quiver(0, 0, p(1), p(2), 1)
quiver(0, 0, q(1), q(2), 1)
quiver(0, 0, s(1), s(2), 1)
quiver(0, 0, 1, 0, 1, 'Color','k', 'LineWidth', 2)
quiver(0, 0, 0, 1, 1, 'Color','k', 'LineWidth', 2)
quiver(0, 0, 0, 10, 1, 'Color','k')
quiver(0, 0, 10, 0, 1, 'Color','k')
text(q(1), q(2), '\bfq');
text(p(1), p(2), '\bfp');
text(s(1), s(2), '\bfs');
text(mp(1), mp(2), '\bfmp');
text(nq(1), nq(2), '\bfnq');
text(1, 0.25, '\bfi');
text(0, 1.25, '\bfj');
text(-0.25, 5, '\bfY', 'Color','k');
text(5, -0.25, '\bfX', 'Color','k');
axis equal;

%% Задание 7
% На плоскости даны три вектора a = {3,2}, 
% b = {-2,1}, c = {4,-4}. Определите разложение 
% каждого из этих трёх векторов, принимая в 
% качестве базиса  два других. Графическое окно 
% разбейте на четыре области.  Во всех окнах 
% изобразите координатные оси Ox и Oy,  орты i, j. 
% В первом изобразите три вектора. В оставшихся трёх – 
% геометрическую интерпретацию разложения каждого из 
% этих трёх векторов по двум остальным. Векторы базиса 
% представьте синим цветом, разлагаемый вектор – красным. 
figure("Name", "Задание 7", "NumberTitle","off");
a = [3,2];
b = [-2,1];
c = [4,-4];

subplot(2,2,1);
hold on;
grid on;
quiver(0,0,a(1),a(2),1);
quiver(0,0,b(1),b(2),1);
quiver(0,0,c(1),c(2),1);
quiver(0,-4,0,6,1, 'Color', 'k');
quiver(-2,0,6,0,1, 'Color', 'k');
quiver(0,0,1,0,1, 'Color', 'k', 'LineWidth',2);
quiver(0,0,0,1,1, 'Color', 'k', 'LineWidth',2);
text(3,2,"a");
text(-2,1,"b");
text(4,-4,"c");
text(1,0,"i");
text(0.15,1,"j");
text(4,0,"X");
text(0,2,"Y");
axis equal;
axis([-2 4 -4 2]);


subplot(2,2,2);
hold on;
grid on;
decA = decompose(b,c,a);
quiver(0, 0, b(1), b(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, decA(1)*b(1), decA(1)*b(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, c(1), c(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, decA(2)*c(1), decA(2)*c(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, a(1), a(2), 1, 'color', 'red', 'lineWidth', 2)
quiver(0,-4,0,6,1, 'Color', 'k');
quiver(-2,0,6,0,1, 'Color', 'k');
quiver(0,0,1,0,1, 'Color', 'k', 'LineWidth',2);
quiver(0,0,0,1,1, 'Color', 'k', 'LineWidth',2);
text(1,0,"i");
text(0.15,1,"j");
text(4,0,"X");
text(0,2,"Y");
axis equal;
axis([-8 10 -5 8]);

subplot(2,2,3);
hold on;
grid on;
decB = decompose(a,c,b);
quiver(0, 0, a(1), a(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, decB(1)*a(1), decB(1)*a(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, c(1), c(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, decB(2)*c(1), decB(2)*c(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, b(1), b(2), 1, 'color', 'red')
quiver(0,-4,0,6,1, 'Color', 'k');
quiver(-2,0,6,0,1, 'Color', 'k');
quiver(0,0,1,0,1, 'Color', 'k', 'LineWidth',2);
quiver(0,0,0,1,1, 'Color', 'k', 'LineWidth',2);
text(1,0,"i");
text(0.15,1,"j");
text(4,0,"X");
text(0,2,"Y");
axis equal;
axis([-2 4 -4 2]);

subplot(2,2,4);
hold on;
grid on;
decC = decompose(a,b,c);
quiver(0, 0, a(1), a(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, decC(1)*a(1), decC(1)*a(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, b(1), b(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, decC(2)*b(1), decC(2)*b(2), 1, 'color', 'blue', 'lineWidth', 2)
quiver(0, 0, c(1), c(2), 1, 'color', 'red', 'lineWidth', 2)
quiver(0,-4,0,6,1, 'Color', 'k');
quiver(-2,0,6,0,1, 'Color', 'k');
quiver(0,0,1,0,1, 'Color', 'k', 'LineWidth',2);
quiver(0,0,0,1,1, 'Color', 'k', 'LineWidth',2);
text(1,0,"i");
text(0.15,1,"j");
text(4,0,"X");
text(0,2,"Y");
axis equal;
axis([-2 6 -4 2]);



%% Задание 8
% Даны четыре вектора a = {2,1,0}, 
% b = {1,-1,2},  c = {2,2,-1} и 
% d = {3,7,-7}. Определите разложение 
% вектора а, принимая в качестве базиса 
% три остальных вектора. Сделайте геометрическую 
% интерпретацию задачи на 2 рисунках. На 
% первом рисунке изобразите координатные 
% оси, орты осей и четыре вектора. На втором – 
% геометрическую интерпретацию разложения вектора а. 
% Векторы базиса представьте синим цветом, разлагаемый 
% вектор – красным.
figure("Name", "Задание 8", "NumberTitle","off");
a = [2,1,0];
b = [1,-1,2];
c = [2,2,-1];
d = [3,7,-7];

subplot(1,2,1);
hold on;
grid on;
quiver3(0,0,0,a(1),a(2),a(3),1);
quiver3(0,0,0,b(1),b(2),b(3),1);
quiver3(0,0,0,c(1),c(2),c(3),1);
quiver3(0,0,0,d(1),d(2),d(3),1);
quiver3(0,0,0,1,0,0,1, 'Color', 'k', 'LineWidth',2);
quiver3(0,0,0,0,1,0,1, 'Color', 'k', 'LineWidth',2);
quiver3(0,0,0,0,0,1,1, 'Color', 'k', 'LineWidth',2);
quiver3(-1,0,0,7,0,0,1, 'Color', 'k');
quiver3(0,-1,0,0,8,0,1, 'Color', 'k');
quiver3(0,0,-7,0,0,9,1, 'Color', 'k');
text(1,0,0,"i");
text(0.15,1,0,"j");
text(0.15,0,1,"k");
text(4,0,0,"X");
text(0,2,0,"Y");
text(0,0,2,"Z");
axis equal;
view(127,32)

subplot(1,2,2);
hold on;
grid on;
opr = det(horzcat(b', c', d'));
opr1 = det(horzcat(a', c', d'));
opr2 = det(horzcat(b', a', d'));
opr3 = det(horzcat(b', c', a'));
decA = [opr1/opr, opr2/opr, opr3/opr];
quiver3(0, 0, 0, decA(1)*b(1), decA(1)*b(2), decA(1)*b(3), 1, 'b');
quiver3(0, 0, 0, decA(2)*c(1), decA(2)*c(2), decA(2)*c(3), 1, 'b');
quiver3(0, 0, 0, decA(3)*d(1), decA(3)*d(2), decA(3)*d(3), 1, 'b');
quiver3(0, 0, 0, a(1), a(2), a(3), 1, 'r');

quiver3(0,0,0,1,0,0,1, 'Color', 'k', 'LineWidth',2);
quiver3(0,0,0,0,1,0,1, 'Color', 'k', 'LineWidth',2);
quiver3(0,0,0,0,0,1,1, 'Color', 'k', 'LineWidth',2);
quiver3(-1,0,0,7,0,0,1, 'Color', 'k');
quiver3(0,-1,0,0,8,0,1, 'Color', 'k');
quiver3(0,0,-7,0,0,9,1, 'Color', 'k');
text(1,0,0,"i");
text(0.15,1,0,"j");
text(0.15,0,1,"k");
text(4,0,0,"X");
text(0,2,0,"Y");
text(0,0,2,"Z");
axis equal;
view(174,36)

%% Задание 9
% Даны векторы a = {-1,2,0}, b = {0,1,2} и  
% c = {1,2,2}. Используя функцию isequal, 
% проверьте свойства 1, 2, 2’, 3, 3’, 4 
% скалярного произведения векторов 
% ([1], стр. 40).
a = [-1,2,0];
b = [0,1,2];
c = [1,2,2];
disp("Свойство 1: (a,b)=(b,a) - верно?")
isEqual1 = isequal(dot(a,b), dot(b,a))
disp("Свойство 2: (a+b,c)=(a,c)+(b,c) - верно?")
isEqual2 = isequal(dot(a+b,c), dot(a,c) + dot(b,c))
disp("Свойство 2': (a,b+c)=(a,b)+(a,c) - верно?")
isEqual22 = isequal(dot(a,b+c), dot(a,b)+dot(a,c))
disp("Свойство 3: (αa,b)=α(a,b) - верно?")
isEqual3 = isequal(dot(3*a,b), 3*dot(a,b))
disp("Свойство 3': (a,αb)=α(a,b) - верно?")
isEqual33 = isequal(dot(a,3*b), 3*dot(a,b))
disp("Свойство 4: (a,a)>0, если a!=0; (a,a)=0, если a=0  - верно?")
a = [-1,2,0]
scalar_a_a = dot(a,a)
nullA = [0,0,0]
scalar_null_a_a = dot(nullA,nullA)

%% Задание 10
% Даны векторы a = {-1,2,0}, b = {0,1,2} 
% и  c = {1,2,2}. Используя функцию isequal, 
% убедитесь в невыполнении равенств 
% (2), (3), (4) ([1], стр. 40).
a = [-1,2,0];
b = [0,1,2];
c = [1,2,2];
disp("Свойство 2: (a,b)*c=a*(b,c) - верно?")
isEqualPr2 = isequal(dot(a,b)*c, a*dot(b,c))
disp("Свойство 3: a*b=a*c => b=c - верно?")
posylka = isequal(a.*b, a.*c)
zakluchenye = isequal(b,c)
disp("Свойство 4: (a,b)*b=a*(b,b) - верно?")
isEqualPr4 = isequal(dot(a,b)*b, a*dot(b,b))
%% Функция для 7 задания
% раскладывает s по p и q
function [mn] = decompose(p,q,s)
opr = det(horzcat(p', q'));
opr1 = det(horzcat(s', q'));
opr2 = det(horzcat(p', s'));
mn = [opr1/opr, opr2/opr];
end