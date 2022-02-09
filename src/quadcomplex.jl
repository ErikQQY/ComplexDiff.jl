import Base: sin, cos, tan, cot, sec, csc, atan

import Base: sinh, cosh, tanh, coth, sech, csch

import Base: abs, exp, log, zero, one

import Base: +, -, *, /, ^



struct quadcomplex
    i1
    i2
end

function mat(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    return [i1 -i2; i2 i1]
end

function mat2quadcomplex(matrix)
    out1, out2 = matrix[1, 1], matrix[2, 1]
    return quadcomplex(out1, out2)
end

## Basic operators: +, -, *, /, ^

+(quad1::quadcomplex, quad2::quadcomplex) = mat2quadcomplex(mat(quad1)+mat(quad2))
+(n, quad::quadcomplex) = mat2quadcomplex(n.+mat(quad))
+(quad::quadcomplex, n) = +(n, quad)

-(quad1::quadcomplex, quad2::quadcomplex) = mat2quadcomplex(mat(quad1)-mat(quad2))
-(n, quad::quadcomplex) = mat2quadcomplex(n.-mat(quad))
-(quad::quadcomplex) = mat2quadcomplex(-mat(quad))

*(quad1::quadcomplex, quad2::quadcomplex) = mat2quadcomplex(mat(quad1)*mat(quad2))
*(n, quad::quadcomplex) = mat2quadcomplex(n*mat(quad))
*(quad::quadcomplex, n) = *(n, quad)

/(quad1::quadcomplex, quad2::quadcomplex) = mat2quadcomplex(mat(quad1)/mat(quad2))
/(n, quad::quadcomplex) = n*inv(quad)

^(quad::quadcomplex, power) = mat2quadcomplex(mat(quad)^power)

function zero(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    return quadcomplex(zero(i1), zero(i2))
end

function one(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    return quadcomplex(one(i1), one(i2))
end

## Basic functions: abs, exp, log

function abs(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    return sqrt(i1^2+i2^2)
end

function exp(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    out1 = exp(i1)*cos(i2)
    out2 = exp(i1)*sin(i2)
    return quadcomplex(out1, out2)
end

## Basic math functions: sin, cos, tan, cot, sec, csc

function sin(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    out1 = cosh(i2)*sin(i1)
    out2 = sinh(i2)*cos(i1)
    return quadcomplex(out1, out2)
end

function cos(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    out1 = cosh(i2)*cos(i1)
    out2 = -sinh(i2)*sin(i1)
    return quadcomplex(out1, out2)
end

tan(quad::quadcomplex) = sin(quad)/cos(quad)
cot(quad::quadcomplex) = cos(quad)/sin(quad)
sec(quad::quadcomplex) = 1/cos(quad)
csc(quad::quadcomplex) = 1/sin(quad)


## Basic hyperbolic functions: sinh, cosh, tanh, coth, sech, csch

function sinh(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    out1 = cosh(i1)*cos(i2)
    out2 = sinh(i1)*sin(i2)
    return quadcomplex(out1, out2)
end

function cosh(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    out1 = sinh(i1)*cos(i2)
    out2 = cosh(i1)*sin(i2)
    return quadcomplex(out1, out2)
end

tanh(quad::quadcomplex) = sinh(quad)/cosh(quad)
coth(quad::quadcomplex) = cosh(quad)/sinh(quad)
sech(quad::quadcomplex) = 1/cosh(quad)
csch(quad::quadcomplex) = 1/sinh(quad)



function image4(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    return image3(i2)
end

function quadderivative(f, point, h)
    result = image4(f(quadcomplex(tricomplex(bicomplex(point+im*h, h), h), h)))/h^4
    return result
end