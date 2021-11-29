module ReversiBoard
export Board, is_valid, is_full, scores, is_valid_and_empty, printb

mutable struct Board
    board::Matrix{Int}
end

printstyled

function Board()
    b = (zeros(Int, 8, 8))
    b[CartesianIndex(4, 4)] = 2
    b[CartesianIndex(4, 5)] = 1
    b[CartesianIndex(5, 4)] = 1
    b[CartesianIndex(5, 5)] = 2
    Board(b)
end

function printb(b::Board)
    printb(b.board)
end

function printb(v::Matrix)
    println("╔═════════════════╗\n║  A B C D E F G H║\n╠═╦═╤═╤═╤═╤═╤═╤═╤═╣")
    for col in 1:8
        println("║$col" * "║", chop(join([(x == 1) ? "░│" : (x == 2) ? "█│" : (x == 9) ? "╳│" : "⠀│" for x in v[col:col, :]]), tail=1), "║")
        if col < 8
            println("╟─╫─┼─┼─┼─┼─┼─┼─┼─╢")
        end
    end
    p1, p2 = scores(v)
    println("╠═╩═╧═╧═╧╦╧═╧═╧═╧═╣\n║ P1: $(lpad(p1, 2, "0")) ║ P2: $(lpad(p2, 2, "0")) ║\n╚════════╩════════╝")
    end
    


function is_valid(b::Board, x::Int, y::Int)::Bool
    return ((0 < x <= 8) && (0 < y <= 8))
end

function is_valid_and_empty(b::Board, x::Int, y::Int)::Bool
    return (((0 < x <= 8) && (0 < y <= 8)) && b.board[CartesianIndex(x, y)] == 0)
end

function is_full(b::Board)::Bool
    for i in eachindex(b.board)
        if b.board[i] == 0
            return false
        end
    end
    return true
end

function scores(v::Matrix)::Vector{Int}
    p1 = 0
    p2 = 0
    for i in eachindex(v)
        if v[i] == 1
            p1 += 1
        elseif v[i] == 2
            p2 += 1
        end
    end
    return [p1, p2]
end

function scores(b::Board)::Vector{Int}
    return scores(b.board)
end
end