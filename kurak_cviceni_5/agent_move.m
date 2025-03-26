% This function should simulate move of the AI/computer
% It should use the minimax algorithm we should be using

function board = agent_move(board)
    bestScore = Inf;
    bestMove = [];

    for row = 1:3
        for col = 1:3
            if board(row, col) == 0
                board(row, col) = -1; % Agent move
                score = minmax(board, 0, -Inf, Inf, true); % Next is player (maximizing)
                board(row, col) = 0;

                if score < bestScore
                    bestScore = score;
                    bestMove = [row, col];
                end
            end
        end
    end

    if ~isempty(bestMove)
        board(bestMove(1), bestMove(2)) = -1;
    end
end
