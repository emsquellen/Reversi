module ReversiUtils
export input

function input(prompt::AbstractString = "")::String
    println(prompt)
    return chomp(readline())
end

end