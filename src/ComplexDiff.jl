module ComplexDiff

include("unicomplex.jl")
include("bicomplex.jl")
include("tricomplex.jl")
include("quadcomplex.jl")
include("pentacomplex.jl")

include("jacobian.jl")

export image2
export bicomplex, tricomplex, quadcomplex, pentacomplex
export derivative, biderivative, triderivative, quadderivative, pentaderivative
export jacobian

end
