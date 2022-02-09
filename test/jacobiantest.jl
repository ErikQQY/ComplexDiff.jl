@testset "Test Jacobian matrix" begin
    @test isapprox(jacobian(sin, [1, 2, 3], 0.0000001), [0.540302 0.0 0.0; 0.0 -0.416147 0.0; 0.0 0.0 -0.989992]; atol=1e-5)
end