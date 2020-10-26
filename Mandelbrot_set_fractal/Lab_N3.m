% 3D ������� � MatLab
% ������������ ���������� � MatLab
function Lab_N3
start_parallel;
f1PARALLEL(true)
close all;
% ���������� �������� ������������
[X, Y, Z] = mandelbrot(-3:.01:3, -2:.01:2, 4, 500)
figure(1); h = pcolor(X,Y,Z); shading interp;
colormap(jet(128));
set(h,'ButtonDownFcn',@ButtonDownFcn)
end

