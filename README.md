# ComplexDiff.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://ErikQQY.github.io/ComplexDiff.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://ErikQQY.github.io/ComplexDiff.jl/dev)
[![Build Status](https://github.com/ErikQQY/ComplexDiff.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ErikQQY/ComplexDiff.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/ErikQQY/ComplexDiff.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/ErikQQY/ComplexDiff.jl)

ComplexDiff.jl fully utilize the complex step differentiation to compute accurate and high order derivative.

### Get start

```julia
pkg> add ComplexDiff
```

### High precision derivative computing

While there are [round-off error](https://en.wikipedia.org/wiki/Round-off_error) when we are using [finite difference](https://en.wikipedia.org/wiki/Finite_difference) to get derivative, by using Complex Step Differentiation, we can obtain extremely high precision derivative.

```julia
julia> using ComplexDiff
julia> derivative(sin, 1, 1e-15)
0.5403023058681398
```

### Jacobian and Hessian

It is also very easy to compute Jacobian matrix and Hessian matrix using complex step differentiation:

```julia
julia> jacobian(sin, [1, 2, 3], 0.0000001)
3×3 Matrix{Float64}:
 0.540302   0.0        0.0
 0.0       -0.416147   0.0
 0.0        0.0       -0.989992
```

## References

If you are also interested in Complex Step Differentiation, please see the following papers:

* [Computation of higher-order derivatives using the multi-complex step method](https://folk.ntnu.no/preisig/HAP_Specials/AdvancedSimulation_files/2014/AdvSim-2014__Verheule_Adrian_Complex_differenetiation.pdf)

* [Using Multicomplex Variables for Automatic Computation of High-Order](https://www.researchgate.net/publication/240637774_Using_Multicomplex_Variables_for_Automatic_Computation_of_High-Order_Derivatives)