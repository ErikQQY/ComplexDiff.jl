using ComplexDiff
using Test

@testset "Test Third Order Derivative" begin
    @test isapprox(triderivative(sin, 1, 0.00001), -cos(1); atol=1e-5)
end