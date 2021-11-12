using ComplexDiff
using Test

@testset "Test Second Order Derivative" begin
    @test isapprox(derivative(x->x^2, 1, 0.00001), 2; atol=1e-5)
end