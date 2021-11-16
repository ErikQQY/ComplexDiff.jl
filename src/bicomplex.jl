import Base: sin, cos, tan, cot, sec, csc, atan

import Base: sinh, cosh, tanh, coth, sech, csch

import Base: abs, exp, log, zero

import Base: +, -, *, /, ^



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

function tan(bi::bicomplex)
    return sin(bi)/cos(bi)
end

function cot(bi::bicomplex)
    return cos(bi)/sin(bi)
end

function sec(bi::bicomplex)
    return 1/cos(bi)
end

function csc(bi::bicomplex)
    return 1/sin(bi)
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

function tanh(bi::bicomplex)
    return sinh(bi)/cosh(bi)
end

function coth(bi::bicomplex)
    return cosh(bi)/sinh(bi)
end

function sech(bi::bicomplex)
    return 1/cosh(bi)
end

function csch(bi::bicomplex)
    return 1/sinh(bi)
end


function image2(bi::bicomplex)
    i1, i2 = bi.i1, bi.i2
    return imag(i2)
end


function biderivative(f, point, h)
    result = image2(f(bicomplex(point+im*h, h)))/h^2
    return result
end