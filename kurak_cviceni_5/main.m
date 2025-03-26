%This is the main function in which I bring the whole game together

function main()
    clc; %for clarity of the output
    disp('Vitejte v hre piskvorky');
    disp(' ');
    disp('Navod:');
    disp('Hracia plocha je 3x3 stvorceky');
    disp('Vas symbol je O, pocitac pouziva symbol X');
    disp('Postupne sa s pocitacom striedate - oznacujete jedno policko za kolo');
    disp('Prvy z vas, komu sa podari zoradit 3 vase symboly za sebou (horizontalne, vertikalne, alebo diagonalne) vyhral');
    disp('Ak zaplnite vsetky policka, no nikto nebol schopny zoradit 3 symboly, hra konci remizou');
    disp(' ');
    disp('Ako hrat:');
    disp('Hra je v textovom formate, takze vzdy budete opytany, kde chcete symbol zadat');
    disp('Symbol umiestnite zadanim riadku a to zadanim cisla 1-3 a nasledne stlpca, znova 1-3');
    board = zeros(3);
    disp(' ');
    disp(' ');
    
    while true
        choice = lower(input('Kto chcete aby zacal ? Napiste "hrac" alebo "pc": ', 's'));
        if strcmp(choice, 'hrac')
            playerTurn = true;
            break;
        elseif strcmp(choice, 'pc')
            playerTurn = false;
            break;
        else
            disp('Nespravny vstup. Prosim uvedte "hrac" alebo "pc".');
        end
    end


    gameOver=false;

    while ~gameOver
        clc;
        print_field(board)

        if playerTurn
            board = player_move(board);
        else
            board = agent_move(board);
        end
        winner = check_winner(board);
        if winner ~= 0 || all (board(:) ~= 0)
            clc;
            print_field(board);
            if winner == 1
                disp('Vyhra !');
            elseif winner == -1
                disp('Prehra !');
            else
                disp('Remiza !')
            end
            gameOver = true;
        else
            playerTurn = ~playerTurn;
        end
    end
end


