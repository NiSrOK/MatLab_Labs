function ButtonDownFcn(varargin)
N = 3000; R = 5; max_N = 350;
XLim = get(gca,'XLim');
YLim = get(gca,'YLim');
h_tic = tic;
[X, Y, Z] = mandelbrot(linspace(XLim(1),XLim(2),max_N), linspace(YLim(1),YLim(2),N), R, max_N);
T = toc(h_tic);
set(varargin{1},'XData',X,'YData',Y,'ZData',Z,'CData',Z)
title(T);
%h = pcolor(X,Y,Z); shading interp;
%set(h,'ButtonDownFcn',@ButtonDownFcn)