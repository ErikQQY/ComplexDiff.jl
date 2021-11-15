using ComplexDiff
using Test

@testset "Test Second Order Derivative" begin
    @test isapprox(biderivative(x->x^2, 1, 0.00001), 2; atol=1e-5)
    @test isapprox(biderivative(x->1/sin(x), 1, 0.000001), 1/2*(3+cos(2))*csc(1)^3; atol=1e-5)
end