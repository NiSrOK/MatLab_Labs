function [XY] = serpinsky(N, ABC)
n = size(ABC, 1);
XY = zeros(N,2);
XY(1,:) = rand(1,2);
for i=2:N
XY(i,:)=(XY(i-1,:) + ABC(ceil(rand(1)*n),:))/2;
end
