module Reversi

include("ReversiUtils.jl")
include("ReversiBoard.jl")
include("ReversiLogic.jl")
include("ReversiPlayer.jl")
include("ReversiCLI.jl")
include("ReversiUI.jl")

ReversiCLI.play_game_vs_ai()

end
