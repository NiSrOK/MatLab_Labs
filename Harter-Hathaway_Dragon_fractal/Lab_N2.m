% Построение фрактала "Дракон Хартера-Хатуэйя"
function Lab_N2
[XY] = dragon(15);
figure(1); plot(XY(:,1),XY(:,2),'-r'); axis equal; %exis normal