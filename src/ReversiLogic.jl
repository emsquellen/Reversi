module ReversiLogic

using ..ReversiBoard
export check_move, make_move, get_all_valid_moves

function check_move(b::Board, x::Int, y::Int, player::Int)
    if !is_valid_and_empty(b, x, y)
        return false
    end
    opponent = player == 1 ? 2 : 1
    for i = -1:1
        for j = -1:1
            xpos = x + i
            ypos = y + j
            if is_valid(b, xpos, ypos) && b.board[CartesianIndex(xpos, ypos)] == opponent
                while is_valid(b, xpos, ypos) &&
                    b.board[CartesianIndex(xpos, ypos)] == opponent
                    xpos += i
                    ypos += j
                end
                if is_valid(b, xpos, ypos) && b.board[CartesianIndex(xpos, ypos)] == player
                    return true
                end
            end
        end
    end
    return false
end

function make_move(b::Board, x::Int, y::Int, player::Int)
    if !is_valid_and_empty(b, x, y)
        return false
    end
    b.board[CartesianIndex(x, y)] = player
    opponent = player == 1 ? 2 : 1
    for i = -1:1
        for j = -1:1
            if i == 0 && j == 0
                continue
            end
            xpos = x + i
            ypos = y + j
            if is_valid(b, xpos, ypos) && b.board[CartesianIndex(xpos, ypos)] == opponent
                while is_valid(b, xpos, ypos) &&
                    b.board[CartesianIndex(xpos, ypos)] == opponent
                    xpos += i
                    ypos += j
                end
                if is_valid(b, xpos, ypos) && b.board[CartesianIndex(xpos, ypos)] == player
                    while !(xpos == x && ypos == y)
                        b.board[CartesianIndex(xpos, ypos)] = player
                        xpos -= i
                        ypos -= j

                    end
                end
            end
        end
    end
end


function get_all_valid_moves(b::Board, player::Int)
    L = []
    for i in CartesianIndices(b.board)
        if check_move(b, i[1], i[2], player)
            push!(L, [i[1], i[2]])
        end
    end
    return L
end

end