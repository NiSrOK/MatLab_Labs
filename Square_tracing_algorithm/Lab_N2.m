% Построение фрактала "Дракон Хартера-Хатуэйя"
function Lab_N2
[XY] = dragon();
figure(1);
plot(XY(:,1),XY(:,2),'*'); axis equal; grid on;hold on;
plot(XY(:,1),XY(:,2),'-r');grid on; axis equal; hold on;
set(gca, 'XTick',-1:0.125:5,'YTick',-1:0.125:5)
XY
