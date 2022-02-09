import Base: sin, cos, tan, cot, sec, csc
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

reim(bi::bicomplex) = (bi.i1, bi.i2)

==(a::bicomplex, b::bicomplex) = a.i1 == b.i1 && a.i2 == b.i2

## Basic operators: +, -, *, /, ^

+(bi1::bicomplex, bi2::bicomplex) = mat2bicomplex(mat(bi1)+mat(bi2))
+(bi::bicomplex, n) = mat2bicomplex(n.+mat(bi))
+(n, bi::bicomplex) = +(bi, n)

-(bi1::bicomplex, bi2::bicomplex) = mat2bicomplex(mat(bi1)-mat(bi2))
-(bi::bicomplex, n) = mat2bicomplex(mat(bi).-n)
-(n, bi::bicomplex) = -(bi, n)
-(bi::bicomplex) = mat2bicomplex(-mat(bi))


*(bi1::bicomplex, bi2::bicomplex) = mat2bicomplex(mat(bi1)*mat(bi2))
*(n, bi::bicomplex) = mat2bicomplex(n*mat(bi))
*(bi::bicomplex, n) = *(n, bi)

/(bi1::bicomplex, bi2::bicomplex) = mat2bicomplex(mat(bi1)/mat(bi2))
/(n, bi::bicomplex) = mat2bicomplex(n*inv(mat(bi)))
/(bi::bicomplex, n) = mat2bicomplex(mat(bi)/n)

^(bi::bicomplex, power) = mat2bicomplex(mat(bi)^power)

zero(bi::bicomplex) = bicomplex(zero(bi.i1), zero(bi.i2))


## Basic functions: abs, exp, log

abs(bi::bicomplex) = sqrt(bi.i1^2 + bi.i2^2)

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

angle(bi::bicomplex) = atan(bi.i2/bi.i1)


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