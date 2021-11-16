using ComplexDiff
using Test

@testset "Test Third Order Derivative" begin
    @test isapprox(triderivative(sin, 1, 0.00001), -cos(1); atol=1e-5)
    @test isapprox(triderivative(x->x^3, 1, 0.00001), 6; atol=1e-5)
    @test isapprox(triderivative(x->x^4, 1, 0.0000001), 24; atol=1e-5)
end