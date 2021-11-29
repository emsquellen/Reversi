module ReversiPlayer

using Random
using ..ReversiBoard
using ..ReversiLogic
using ..ReversiUtils
export random_ai, cool_random_ai, get_valid_move_input

function random_ai(b::Board, player::Int)::Vector{Int}
    return rand(get_all_valid_moves(b, player))
end

function get_valid_move_input(b::Board, player::Int)::Vector{Int}
    vm = get_all_valid_moves(b, player)
    move = [-1, -1]
    while !(move in vm)
        in = input("Choose a move: ")
        if occursin(uppercase(in)[begin], "ABCDEFGH") && length(in) == 2
            move =
                [parse(Int, in[end]), findfirst(isequal(uppercase(in)[begin]), "ABCDEFGH")]
        end
    end
    return move
end

function cool_random_ai(b::Board, player::Int)::Vector{Int}
    moves = get_all_valid_moves(b, player)
    move_weight = [get_move_weight(move...) for move in moves]
    return moves[findfirst(item -> item == maximum(move_weight), move_weight)]
end

function get_move_weight(x::Int, y::Int)::Float64
    return [
        [1, -1, 0.5, 0.25, 0.25, 0.5, -1, 1],
        [-1, -1, 0.5, 0, 0, 0.5, -1, -1],
        [0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5],
        [0.25, 0, 0, 0, 0, 0, 0, 0, 0.25],
        [0.25, 0, 0, 0, 0, 0, 0, 0, 0.25],
        [0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5],
        [-1, -1, 0.5, 0, 0, 0.5, -1, -1],
        [1, -1, 0.5, 0.25, 0.25, 0.5, -1, 1],
    ][y][x]
end
end
