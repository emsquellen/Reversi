module ReversiCLI

using ..ReversiLogic
using ..ReversiBoard
using ..ReversiPlayer
using ..ReversiUtils
export play_game, play_game_vs_ai, ai_vs_ai

function play_game()
    println("\n")
    b = Board()
    players = [1, 2]
    while true
        for p in players
            vm = get_all_valid_moves(b, p)
            if length(vm) == 0
                println("No valid moves for player $p. Skipping turn")
                continue
            end
            println("Valid moves: (marked with 9) ")
            view_valid_moves(b, p)
            display(vm)
            println("\n")
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
                return nothing
            end
        end
    end
end


function play_game_vs_ai()
    b = Board()
    println("\n")
    while true
        vm = get_all_valid_moves(b, 1)
        if length(vm) == 0
            println("No valid moves for player 1. Skipping turn")
            continue
        end
        println("Valid moves: (marked with 9) ")
        view_valid_moves(b, 1)
        display(vm)
        println("\n")
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
        ai_move = cool_random_ai(b, 2)
        make_move(b, ai_move[1], ai_move[2], 2)
        display(b.board)
        println("\n")
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
            return nothing
        end
    end

end

function ai_vs_ai()
    b = Board()
    println("\n")
    players = [1, 2]
    while true
        for p in players
            vm = get_all_valid_moves(b, p)
            if length(vm) == 0
                println("No valid moves for player $p. Skipping turn")
                continue
            end
            move = random_ai(b, p)
            make_move(b, move[1], move[2], p)
            display(b.board)
            println("\n")
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
                return nothing
            end
        end

    end

end

function coolai_vs_coolai()
    b = Board()
    println("\n")
    players = [1, 2]
    while true
        for p in players
            vm = get_all_valid_moves(b, p)
            if length(vm) == 0
                println("No valid moves for player $p. Skipping turn")
                continue
            end
            move = cool_random_ai(b, p)
            make_move(b, move[1], move[2], p)
            display(b.board)
            println("\n")
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
                return nothing
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
    println("\n")
    return nothing
end

end
