% we need to check after every move, how is the current state of the game
% just looking up logic of piskvorky/tictactoe will reveal the logic behind
% this function

function winner = check_winner(board)
    lines = [board; board'; diag(board)'; diag(flipud(board))'];
    for i = 1:size(lines, 1)
        if all(lines(i,:) == 1)
            winner = 1;
            return;
        elseif all(lines(i,:) == -1)
            winner = -1;
            return;
        end
    end
    winner = 0;
end
