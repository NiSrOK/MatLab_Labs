%Знакомство с матлаб. Изучение механизмов откладки и оптимизации.
function Lab_N1
ABC = [0 0; 0.5 sqrt(3)/2; 1 0];
N = 100000;
t = zeros(3,1);
fun_list = { @serpinsky 0; @serpinsky_01 0; @serpinsky_02 0};
for i=1:size(fun_list,1)
    tic; [XY] = fun_list{i,1}(N,ABC); fun_list{i,2} = toc;
end;
format long; disp(fun_list); format short;
figure(1);
h_xy = plot(XY(:,1),XY(:,2),'.k'); 
hold on;
set(h_xy,'LineWidth', 0.1,'MarkerSize',1);
h_ABC = plot(ABC([1:end 1],1),ABC([1:end 1],2),'r-'); 
hold off;
set(h_ABC,'LineWidth', 4); 
hold off;