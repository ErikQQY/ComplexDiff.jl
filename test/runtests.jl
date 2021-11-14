using ComplexDiff
using Test

@testset "ComplexDiff.jl" begin
    include("bicomplextest.jl")
    include("tricomplextest.jl")
end
