function [XY] = serpinsky_02(N, ABC)
n = size(ABC, 1);
XY = zeros(N,2);
XY(1,:) = rand(1,2);
idx = ceil(rand(N,1)*n);
for i=2:N
    XY(i,:)=(XY(i-1,:) + ABC(idx(i),:))/2;
end
