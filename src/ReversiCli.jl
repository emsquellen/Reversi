module ReversiCLI

using Random
using ..ReversiLogic
using ..ReversiBoard
using ..ReversiPlayer

function input(prompt::AbstractString = "")
    print(prompt)
    return parse(Int, chomp(readline()))
end

function play_game()
    b = Board()
    players = [1, 2]
    while true
        for p in players
            vm = get_all_valid_moves(b, p)
            if length(vm) == 0
                printlf("No valid moves for player $p. Skipping turn")
                continue
            end
            println("Valid moves: (marked with 9) ")
            view_valid_moves(b, p)
            display(vm)
            move = [-1, -1]
            while !(move in vm)
                move[1] = input("Choose a move row: ")
                move[2] = input("Choose a move col: ")
            end
            make_move(b, move[1], move[2], p)
            if is_full(b)
                println("GAME OVER")
                p1, p2 = scores(b)
                if p1 == p2
                    println("TIE!")
                elseif p1 > p2
                    println("Player 1 wins! Score $p1. Player 2 score: $p2")
                else
                    println("Player 2 wins! Score $p2. Player 1 score: $p1")
                end
                return
            end
        end

    end
end


function play_gamevs_ai()
    b = Board()
    while true
        vm = get_all_valid_moves(b, 1)
        if length(vm) == 0
            printlf("No valid moves for player 1. Skipping turn")
            continue
        end
        println("Valid moves: (marked with 9) ")
        view_valid_moves(b, 1)
        display(vm)
        move = [-1, -1]
        while !(move in vm)
            move[1] = input("Choose a move row: ")
            move[2] = input("Choose a move col: ")
        end
        make_move(b, move[1], move[2], 1)
        if is_full(b)
            println("GAME OVER")
            p1, p2 = scores(b)
            if p1 == p2
                println("TIE!")
            elseif p1 > p2
                println("Player 1 wins! Score $p1. Player 2 score: $p2")
            else
                println("Player 2 wins! Score $p2. Player 1 score: $p1")
            end
            return
        end
        ai_move = random_ai(b, 2)
        make_move(b, ai_move[1], ai_move[2], 2)
        if is_full(b)
            println("GAME OVER")
            p1, p2 = scores(b)
            if p1 == p2
                println("TIE!")
            elseif p1 > p2
                println("Player 1 wins! Score $p1. Player 2 score: $p2")
            else
                println("Player 2 wins! Score $p2. Player 1 score: $p1")
            end
            return
        end
    end

end

function aivsai()
    b = Board()
    players = [1, 2]
    while true
        for p in players
            vm = get_all_valid_moves(b, p)
            if length(vm) == 0
                printlf("No valid moves for player $p. Skipping turn")
                continue
            end
            move = random_ai(b, p)
            make_move(b, move[1], move[2], p)
            display(b.board)
            if is_full(b)
                println("GAME OVER")
                p1, p2 = scores(b)
                if p1 == p2
                    println("TIE!")
                elseif p1 > p2
                    println("Player 1 wins! Score $p1. Player 2 score: $p2")
                else
                    println("Player 2 wins! Score $p2. Player 1 score: $p1")
                end
                return
            end
        end

    end

end

function view_valid_moves(b::Board, player::Int)
    print_array = deepcopy(b.board)
    possible_moves = get_all_valid_moves(b, player)
    for pos in possible_moves
        print_array[CartesianIndex(pos[1], pos[2])] = 9
    end
    display(print_array)
end



aivsai()

end