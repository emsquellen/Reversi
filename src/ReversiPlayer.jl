module ReversiPlayer
using ..ReversiBoard
using ..ReversiLogic
export random_ai

function random_ai(b::Board, player::Int)::Vector{Int}
    return rand(get_all_valid_moves(b, player))
end

end