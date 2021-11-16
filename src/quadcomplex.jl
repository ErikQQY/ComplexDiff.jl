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

function +(quad1::quadcomplex, quad2::quadcomplex)
    result=mat(quad1)+mat(quad2)
    return mat2quadcomplex(result)
end

function +(n, quad::quadcomplex)
    result=n .+mat(quad)
    return mat2quadcomplex(result)
end

function +(quad::quadcomplex, n)
    result=n .+mat(quad)
    return mat2quadcomplex(result)
end

function -(quad1::quadcomplex, quad2::quadcomplex)
    result=mat(quad1)-mat(quad2)
    return mat2quadcomplex(result)
end

function -(n, quad::quadcomplex)
    result=n .-mat(quad)
    return mat2quadcomplex(result)
end

function -(quad::quadcomplex)
    result=-mat(quad)
    return mat2quadcomplex(result)
end

function *(quad1::quadcomplex, quad2::quadcomplex)
    result=mat(quad1)*mat(quad2)
    return mat2quadcomplex(result)
end

function *(n, quad::quadcomplex)
    result = n*mat(quad)
    return mat2quadcomplex(result)
end

function *(quad::quadcomplex, n)
    result = n*mat(quad)
    return mat2quadcomplex(result)
end

function /(quad1::quadcomplex, quad2::quadcomplex)
    result=mat(quad1)/mat(quad2)
    return mat2quadcomplex(result)
end

function /(n, quad::quadcomplex)
    result=n*inv(quad)
    return result
end

function ^(quad::quadcomplex, power)
    result=mat(quad)^power
    return mat2quadcomplex(result)
end

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

function tan(quad::quadcomplex)
    return sin(quad)/cos(quad)
end

function cot(quad::quadcomplex)
    return cos(quad)/sin(quad)
end

function sec(quad::quadcomplex)
    return 1/cos(quad)
end

function csc(quad::quadcomplex)
    return 1/sin(quad)
end


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

function tanh(quad::quadcomplex)
    return sinh(quad)/cosh(quad)
end

function coth(quad::quadcomplex)
    return cosh(quad)/sinh(quad)
end

function sech(quad::quadcomplex)
    return 1/cosh(quad)
end

function csch(quad::quadcomplex)
    return 1/sinh(quad)
end



function image4(quad::quadcomplex)
    i1, i2 = quad.i1, quad.i2
    return image3(i2)
end

function quadderivative(f, point, h)
    result = image4(f(quadcomplex(tricomplex(bicomplex(point+im*h, h), h), h)))/h^4
    return result
end