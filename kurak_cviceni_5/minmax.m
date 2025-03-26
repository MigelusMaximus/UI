function score = minmax(board, depth, alpha, beta, isPlayerTurn)
    winner = check_winner(board);
    if winner ~= 0
        score = winner * (10 - depth); % Player wins = +, agent wins = -
        return;
    elseif all(board(:) ~= 0)
        score = 0; % Draw
        return;
    end

    if isPlayerTurn
        score = -Inf;
        for row = 1:3
            for col = 1:3
                if board(row, col) == 0
                    board(row, col) = 1; % Simulate player move
                    val = minmax(board, depth + 1, alpha, beta, false);
                    board(row, col) = 0;
                    score = max(score, val);
                    alpha = max(alpha, score);
                    if beta <= alpha
                        return;
                    end
                end
            end
        end
    else
        score = Inf;
        for row = 1:3
            for col = 1:3
                if board(row, col) == 0
                    board(row, col) = -1; % Simulate agent move
                    val = minmax(board, depth + 1, alpha, beta, true);
                    board(row, col) = 0;
                    score = min(score, val);
                    beta = min(beta, score);
                    if beta <= alpha
                        return;
                    end
                end
            end
        end
    end
end
