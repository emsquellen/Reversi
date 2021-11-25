module Reversi

include("ReversiBoard.jl")
include("ReversiLogic.jl")
include("ReversiPlayer.jl")
include("ReversiUtils.jl")
include("ReversiCLI.jl")

ReversiCLI.play_game_vs_ai()

end # module
