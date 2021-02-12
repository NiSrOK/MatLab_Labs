function [XY] = dragon(N, varargin)
XY = [0 0; 1 0];
if ~isempty(varargin)
    XY = varargin(1);
end;
for j=1:N
    n=size(XY,1);
    new_XY = zeros(size(XY,1)*2-1,2);
    new_XY(1:2:end,:) = XY;
    inv_cnt = 1;
    new_n=size(new_XY,1);
    for i=2:2:new_n
        new_XY(i,:) = [new_XY(i+1,:)-new_XY(i-1,:)]*[.5 .5*inv_cnt; -.5*inv_cnt .5]...
            +new_XY(i-1,:);
        inv_cnt = inv_cnt*(-1);
    end;
    XY=new_XY;
end;