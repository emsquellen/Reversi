module Reversi

include("ReversiBoard.jl")
include("ReversiLogic.jl")
include("ReversiPlayer.jl")
include("ReversiUtils.jl")
include("ReversiCLI.jl")

ReversiCLI.coolai_vs_coolai()

end # module
