module ComplexDiff

include("unicomplex.jl")
include("bicomplex.jl")
include("tricomplex.jl")
include("quadcomplex.jl")

export bicomplex, tricomplex, quadcomplex
export biderivative, triderivative, quadderivative

end
