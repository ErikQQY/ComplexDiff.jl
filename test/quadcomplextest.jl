using ComplexDiff
using Test

@testset "Test Second Order Derivative" begin
    @test isapprox(quadderivative(sin, 1, 0.000001), sin(1); atol=1e-5)
end