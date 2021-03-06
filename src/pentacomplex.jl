import Base: sin, cos, tan, cot, sec, csc, atan

import Base: sinh, cosh, tanh, coth, sech, csch

import Base: abs, exp, log

import Base: +, -, *, /, ^



struct pentacomplex
    i1
    i2
end

function mat(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    return [i1 -i2; i2 i1]
end

function mat2pentacomplex(matrix)
    out1, out2 = matrix[1, 1], matrix[2, 1]
    return pentacomplex(out1, out2)
end

## Basic operators: +, -, *, /, ^

function +(penta1::pentacomplex, penta2::pentacomplex)
    result=mat(penta1)+mat(penta2)
    return mat2pentacomplex(result)
end

+(n, penta::pentacomplex) = mat2pentacomplex(n .+mat(penta))

+(penta::pentacomplex, n) = +(n, penta)

-(penta1::pentacomplex, penta2::pentacomplex) = mat2pentacomplex(mat(penta1)-mat(penta2))
-(n, penta::pentacomplex) = mat2pentacomplex(n .-mat(penta))
-(penta::pentacomplex, n) = -(n, penta)
-(penta::pentacomplex) = mat2pentacomplex(-mat(penta))

*(penta1::pentacomplex, penta2::pentacomplex) = mat2pentacomplex(mat(penta1)*mat(penta2))
*(n, penta::pentacomplex) = mat2pentacomplex(n*mat(penta))
*(penta::pentacomplex, n) = *(n, penta)

/(penta1::pentacomplex, penta2::pentacomplex) = mat2pentacomplex(mat(penta1)/mat(penta2))
/(n, penta::pentacomplex) = mat2pentacomplex(n*inv(mat(penta)))
/(penta::pentacomplex, n) = mat2pentacomplex(mat(penta)/n)

^(penta::pentacomplex, power) = mat2pentacomplex(mat(penta)^power)

## Basic functions: abs, exp, log

abs(penta::pentacomplex) = sqrt(penta.i1^2+penta.i2^2)

function exp(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    out1 = exp(i1)*cos(i2)
    out2 = exp(i1)*sin(i2)
    return pentacomplex(out1, out2)
end

## Basic math functions: sin, cos, tan, cot, sec, csc

function sin(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    out1 = cosh(i2)*sin(i1)
    out2 = sinh(i2)*cos(i1)
    return pentacomplex(out1, out2)
end

function cos(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    out1 = cosh(i2)*cos(i1)
    out2 = -sinh(i2)*sin(i1)
    return pentacomplex(out1, out2)
end

tan(penta::pentacomplex) = sin(penta)/cos(penta)
cot(penta::pentacomplex) = cos(penta)/sin(penta)
sec(penta::pentacomplex) = 1/cos(penta)
csc(penta::pentacomplex) = 1/sin(penta)


## Basic hyperbolic functions: sinh, cosh, tanh, coth, sech, csch

function sinh(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    out1 = cosh(i1)*cos(i2)
    out2 = sinh(i1)*sin(i2)
    return pentacomplex(out1, out2)
end

function cosh(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    out1 = sinh(i1)*cos(i2)
    out2 = cosh(i1)*sin(i2)
    return pentacomplex(out1, out2)
end

tanh(penta::pentacomplex) = sinh(penta)/cosh(penta)
coth(penta::pentacomplex) = cosh(penta)/sinh(penta)
sech(penta::pentacomplex) = 1/cosh(penta)
csch(penta::pentacomplex) = 1/sinh(penta)



function image5(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    return image4(i2)
end

function pentaderivative(f, point, h)
    result = image5(f(pentacomplex(quadcomplex(tricomplex(bicomplex(point+im*h, h), h), h), h)))/h^5
    return result
end