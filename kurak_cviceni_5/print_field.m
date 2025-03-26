%this function is for printing our playing field/board.
% It works as sort of displaying algorithm trough text

function print_field(board)
    % Mapping: 0 = empty, 1 = player (O), -1 = agent (X)
    for i = 1:3
        rowStr = '';
        for j = 1:3
            cellVal = board(i,j);
            if cellVal == 1
                symbol = 'O'; % Player
            elseif cellVal == -1
                symbol = 'X'; % Agent
            else
                symbol = ' '; % Empty cell
            end
            rowStr = [rowStr, ' ', symbol];
            if j < 3
                rowStr = [rowStr, ' |'];
            end
        end
        disp(rowStr);
        if i < 3
            disp('---+---+---');
        end
    end
end

