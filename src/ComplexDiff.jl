module ComplexDiff

include("unicomplex.jl")
include("bicomplex.jl")
include("tricomplex.jl")
include("quadcomplex.jl")
include("pentacomplex.jl")

export bicomplex, tricomplex, quadcomplex, pentacomplex
export biderivative, triderivative, quadderivative, pentaderivative

end
