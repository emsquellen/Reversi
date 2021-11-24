module ReversiUtils
export input

function input(prompt::AbstractString = "")::Int
    print(prompt)
    return parse(Int, chomp(readline()))
end

end