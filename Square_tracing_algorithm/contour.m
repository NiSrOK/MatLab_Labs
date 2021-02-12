function [lex] = contour(coordinates,N)
cont = zeros(2^N, 2);
cont(1,1) = 0;
cont(1,2) = 0;
% S = 1; W = 2; N = 3; E = 4;
dir = 1;
start = 0;
i = 1;
m = 2;
lex = zeros(2^N, 2);
lex(1,1) = 0;
lex(1,2) = 0;
while (start<2)
    if (cont(i,1) ==0 && cont(i,2) ==0)
        start = start+1;
        %break;
    end
    for j = 1:2^N
        if (cont(i,1)==coordinates(j,1) && cont(i,2)==coordinates(j,2))
            flag = 1;
            disp("Совпадение")
            disp(cont(i,1));
            disp(cont(i,2));
            break
        else
            flag = 0;
            %disp("Нет совпадений")
            %disp(cont(i,1));
            %disp(cont(i,2));
        end
    end
    switch flag
    case 1
        switch dir
            case 1
                disp("Юг лево");
                cont(i+1,1)=coordinates(j,1)-1;
                cont(i+1,2)=coordinates(j,2);
                dir = 4;
            case 2
                disp("Запад лево");
                cont(i+1,1)=coordinates(j,1);
                cont(i+1,2)=coordinates(j,2)+1;
                dir = 1;
            case 3
                disp("Север лево");
                cont(i+1,1)=coordinates(j,1)+1;
                cont(i+1,2)=coordinates(j,2);
                dir = 2;
            case 4
                disp("Восток лево");
                cont(i+1,1)=coordinates(j,1);
                cont(i+1,2)=coordinates(j,2)-1;
                dir = 3;
            otherwise
                disp('Error')
        end
    case 0
        lex(m,1) = cont(i,1);
        lex(m,2) = cont(i,2);
        m=m+1;
        switch dir
            case 1
                disp("Юг право");
                cont(i+1,1)=cont(i,1)+1;
                cont(i+1,2)=cont(i,2);
                dir = 2;  
            case 2
                disp("Запад право");
                cont(i+1,1)=cont(i,1);
                cont(i+1,2)=cont(i,2)-1;
                dir = 3;
            case 3
                disp("Север право");
                cont(i+1,1)=cont(i,1)-1;
                cont(i+1,2)=cont(i,2);
                dir = 4;
            case 4
                disp("Восток право");
                cont(i+1,1)=cont(i,1);
                cont(i+1,2)=cont(i,2)+1;
                dir = 1;
            otherwise
                disp('Error')
        end
    otherwise
        disp('Error')
    end
    i = i+1;
end
lex(m,1) = 0;
lex(m,2) = 0;
end
