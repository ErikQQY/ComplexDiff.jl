import Base: sin, cos, tan, cot, sec, csc

## Some auxillary functions
import Base: real, imag, reim, ==

import Base: asin, acos, atan

import Base: asinh, acosh, atanh

import Base: sinh, cosh, tanh, coth, sech, csch

import Base: abs, exp, log, zero

import Base: +, -, *, /, ^


## By constructing bicomplex, we can represent multi-complex numbers using recursion
struct bicomplex
    i1
    i2
end

"""
Using matrix to represent bicomplex.
"""
function mat(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    return [i1 -i2; i2 i1]
end

function mat2bicomplex(matrix)
    out1, out2 = matrix[1, 1], matrix[2, 1]
    return bicomplex(out1, out2)
end

function reim(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    return (i1, i2)
end

function ==(a::bicomplex, b::bicomplex)

end

## Basic operators: +, -, *, /, ^

function +(bi1::bicomplex, bi2::bicomplex)
    result = mat(bi1)+mat(bi2)
    return mat2bicomplex(result)
end

function +(bi::bicomplex, n)
    result = n .+mat(bi)
    return mat2bicomplex(result)
end

function +(n, bi::bicomplex)
    result = n .+mat(bi)
    return mat2bicomplex(result)
end

function -(bi1::bicomplex, bi2::bicomplex)
    result = mat(bi1)-mat(bi2)
    return mat2bicomplex(result)
end

function -(bi::bicomplex, n)
    result = mat(bi).-n
    return mat2bicomplex(result)
end


function -(bi::bicomplex)
    result = -mat(bi)
    return mat2bicomplex(result)
end

function *(bi1::bicomplex, bi2::bicomplex)
    result = mat(bi1)*mat(bi2)
    return mat2bicomplex(result)
end

function *(n, bi::bicomplex)
    result = n*mat(bi)
    return mat2bicomplex(result)
end

function *(bi::bicomplex, n)
    result = n*mat(bi)
    return mat2bicomplex(result)
end

function /(bi1::bicomplex, bi2::bicomplex)
    result=mat(bi1)/mat(bi2)
    return mat2bicomplex(result)
end

function /(n, bi::bicomplex)
    result= n*inv(mat(bi))
    return mat2bicomplex(result)
end

function /(bi::bicomplex, n)
    result=mat(bi)/n
    return mat2bicomplex(result)
end

function ^(bi::bicomplex, power)
    result = mat(bi)^power
    return mat2bicomplex(result)
end

function zero(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    return bicomplex(zero(i1), zero(i2))
end


## Basic functions: abs, exp, log

function abs(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    return sqrt(i1^2+i2^2)
end

function exp(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    out1 = exp(i1)*cos(i2)
    out2 = exp(i1)*sin(i2)
    return bicomplex(out1, out2)
end

function log(bi::bicomplex)
    out1 = log(abs(bi))
    out2 = angle(bi)
    return bicomplex(out1, out2)
end

function angle(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    return atan(i2/i1)
end

## Basic math functions: sin, cos, tan, cot, sec, csc

function sin(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    out1 = cosh(i2)*sin(i1)
    out2 = sinh(i2)*cos(i1)
    return bicomplex(out1, out2)
end

function cos(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    out1 = cosh(i2)*cos(i1)
    out2 = -sinh(i2)*sin(i1)
    return bicomplex(out1, out2)
end

tan(bi::bicomplex) = sin(bi)/cos(bi)
cot(bi::bicomplex) = cos(bi)/sin(bi)
sec(bi::bicomplex) = 1/cos(bi)
csc(bi::bicomplex) = 1/sin(bi)


## Basic inverse hyperbolic trig function: asinh, acosh, atanh, acoth, asech, acsch


function atan(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    temp = atanh(bicomplex(-i2, i1))
    return bicomplex(temp.i2, temp.i1)
end

## Basic hyperbolic functions: sinh, cosh, tanh, coth, sech, csch

function sinh(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    out1 = cosh(i1)*cos(i2)
    out2 = sinh(i1)*sin(i2)
    return bicomplex(out1, out2)
end

function cosh(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    out1 = sinh(i1)*cos(i2)
    out2 = cosh(i1)*sin(i2)
    return bicomplex(out1, out2)
end

tanh(bi::bicomplex) = sinh(bi)/cosh(bi)
coth(bi::bicomplex) = cosh(bi)/sinh(bi)
sech(bi::bicomplex) = 1/cosh(bi)
csch(bi::bicomplex) = 1/sinh(bi)


image2(bi::bicomplex) = imag(bi.i2)


biderivative(f, point, h) = image2(f(bicomplex(point+im*h, h)))/h^2