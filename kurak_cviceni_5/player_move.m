% This function allows player to simulate moving/chosing his moves
% Since the implementation is in text form, we have to implement that

function board = player_move(board)
    valid = false;
    while ~valid
        row = input('Zadajte riadok (1-3): ');
        col = input('Zadajte Stlpec (1-3): ');
        if row >= 1 && row <= 3 && col >= 1 && col <= 3 && board(row, col) == 0
            board(row, col) = 1;
            valid = true;
        else
            disp('Invalid move. Try again.');
        end
    end
end
