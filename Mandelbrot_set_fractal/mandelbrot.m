function [X, Y, Z] = mandelbrot(x, y, R, max_N)
[X,Y] = meshgrid (x,y);
C = X + 1i*Y;
Z = zeros(size(X));
if f1PARALLEL
    parfor i=1:numel(Z)
        Z(i) = cycle_body(C(i), max_N, R);
    end
else
    for i=1:numel(Z)
        Z(i) = cycle_body(C(i), max_N, R);
    end
end
end

function Zi = cycle_body(Ci, max_N, R)
Zj = Ci;
        for j=1:max_N
            Zj=Zj.^2+Ci;
            if abs(Zj)>R
                break;
            end
        end
        Zi = j;
end