@testset "Test Second Order Derivative" begin
    @test isapprox(biderivative(x->x^2, 1, 0.00001), 2; atol=1e-5)
    @test isapprox(biderivative(x->1/sin(x), 1, 0.000001), 1/2*(3+cos(2))*csc(1)^3; atol=1e-5)
end

@testset "Test Third Order Derivative" begin
    @test isapprox(triderivative(sin, 1, 0.00001), -cos(1); atol=1e-5)
    @test isapprox(triderivative(x->x^3, 1, 0.00001), 6; atol=1e-5)
    @test isapprox(triderivative(x->x^4, 1, 0.0000001), 24; atol=1e-5)
end

@testset "Test Second Order Derivative" begin
    @test isapprox(quadderivative(sin, 1, 0.000001), sin(1); atol=1e-5)
end