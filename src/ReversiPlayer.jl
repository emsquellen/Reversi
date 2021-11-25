module ReversiPlayer

using Random
using ..ReversiBoard
using ..ReversiLogic
export random_ai, cool_random_ai

function random_ai(b::Board, player::Int)::Vector{Int}
    return rand(get_all_valid_moves(b, player))
end

function cool_random_ai(b::Board, player::Int)::Vector{Int}
    moves = get_all_valid_moves(b, player)
    move_weight = [get_move_weight(move...) for move in moves]
    return moves[findfirst(item -> item == maximum(move_weight), move_weight)]
end

function get_move_weight(x::Int, y::Int)::Int
    if [x, y] in [[1, 1], [1, 8], [8, 1], [8, 8]]
        return 100
    elseif [x, y] in [
        [1, 2],
        [2, 1],
        [2, 2],
        [1, 7],
        [2, 7],
        [2, 8],
        [7, 1],
        [7, 2],
        [8, 2],
        [7, 7],
        [7, 8],
        [8, 7],
    ]
        return -100
    elseif [x, y] in [
        [1, 3],
        [2, 3],
        [3, 3],
        [3, 2],
        [3, 1],
        [1, 6],
        [2, 6],
        [3, 6],
        [3, 7],
        [3, 8],
        [6, 1],
        [6, 2],
        [6, 3],
        [6, 6],
        [6, 7],
        [6, 8],
        [7, 3],
        [8, 3],
    ]
        return 50
    elseif [x, y] in [[1, 4], [1, 5], [4, 1], [4, 8], [5, 1], [5, 8], [8, 4], [8, 5]]
        return 25
    else
        return 0
    end
end

end
