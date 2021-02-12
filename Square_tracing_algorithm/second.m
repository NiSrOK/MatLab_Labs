function second()
    close all;
    N=12;
    coordinates = zeros(2^N, 2);
    coordinates(1,1) = 0;
    coordinates(1,2) = 0;
    tic;                                % Start the time
    L = 1; seq = ones(1,2^N-1);         % Initiate fold sequence of 0s/1s
    for j = 2:N
        seq(L+1) = 1;                   % Perform R fold
        t = (L+2):(2*L+1);
        seq(t) = fliplr(1-seq(1:L));    % Append the flipped sequence
        L = 1 + L*2;                    % New length of fold sequence
    end
    L = length(seq) + 2;                % L = no. of folds + 2 ends
    seq = [2*seq + 1,0];                % Sequence of 0s/1s become 1s/2s
    dx = [0 -1 0 1]; dy = [1 0 -1 0];   % Setup direction changes
    x1 = 0; y1 = 0; dir = 0;            % Initial pt.: (0,0) facing North 
    col = hsv(length(seq));             % hsv colormap
    for i = 1:L-1
        x2 = x1 + dx(dir+1);            % x := x + dx(dir);
        y2 = y1 + dy(dir+1);            % y := y + dy(dir);
        dir = mod(dir + seq(i),4);      % dir = 0,1,2,3 for N,W,S,E
        line([x1 x2],[y1 y2],...        % Plot the i-th line segment
            'Linewidth',1.2);           % Set thicker linewidth
        %fprintf('point: (%d, %d).\n',x2,y2);
        coordinates(i+1,1) = x2;
        coordinates(i+1,2) = y2;
        x1 = x2; y1 = y2;
        hold on;
    end
    box on;
    if N < 8 
        axis([-10 10 -10 10]);          % For small N, zoom out
    else
        axis equal;                     % Otherwise, zoom normally
    end
    fprintf('Start point: (0, 0).\n');
    fprintf('Final point: (%d, %d).\n',x1,y1);
    hold on;
    grid on;
    %set(gca, 'XTick',-100:1:100,'YTick',-100:1:100)
    toc;
    box off;
    [cont] = contour(coordinates,N);
    plot(cont(:,1),cont(:,2),'-r','LineWidth' , 1);grid on; axis equal; hold on;
    %cont
end