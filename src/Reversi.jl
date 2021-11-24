module Reversi

include("ReversiBoard.jl")
include("ReversiLogic.jl")
include("ReversiPlayer.jl")
include("ReversiCLI.jl")

ReversiCLI.aivsai()

end # module
