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

function +(n, penta::pentacomplex)
    result=n .+mat(penta)
    return mat2pentacomplex(result)
end

function +(penta::pentacomplex, n)
    result=n .+mat(penta)
    return mat2pentacomplex(result)
end

function -(penta1::pentacomplex, penta2::pentacomplex)
    result=mat(penta1)-mat(penta2)
    return mat2pentacomplex(result)
end

function -(n, penta::pentacomplex)
    result = n .-mat(penta)
    return mat2pentacomplex(result)
end

function -(penta::pentacomplex)
    result=-mat(penta)
    return mat2pentacomplex(result)
end

function *(penta1::pentacomplex, penta2::pentacomplex)
    result=mat(penta1)*mat(penta2)
    return mat2pentacomplex(result)
end

function *(n, penta::pentacomplex)
    result = n*mat(penta)
    return mat2pentacomplex(result)
end

function /(penta1::pentacomplex, penta2::pentacomplex)
    result=mat(penta1)/mat(penta2)
    return mat2pentacomplex(result)
end

function ^(penta::pentacomplex, power)
    result=mat(penta)^power
    return mat2pentacomplex(result)
end

## Basic functions: abs, exp, log

function abs(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    return sqrt(i1^2+i2^2)
end

function exp(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    out1 = exp(i1)*cos(i2)
    out2 = exp(i1)*sin(i2)
    return pentacomplex(out1, out2)
end

function log(penta::pentacomplex)
    
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

function tan(penta::pentacomplex)
    return sin(penta)/cos(penta)
end

function cot(penta::pentacomplex)
    return cos(penta)/sin(penta)
end

function sec(penta::pentacomplex)
    return 1/cos(penta)
end

function csc(penta::pentacomplex)
    return 1/sin(penta)
end


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

function tanh(penta::pentacomplex)
    return sinh(penta)/cosh(penta)
end

function coth(penta::pentacomplex)
    return cosh(penta)/sinh(penta)
end

function sech(penta::pentacomplex)
    return 1/cosh(penta)
end

function csch(penta::pentacomplex)
    return 1/sinh(penta)
end



function image5(penta::pentacomplex)
    i1, i2 = penta.i1, penta.i2
    return image4(i2)
end

function pentaderivative(f, point, h)
    result = image5(f(pentacomplex(quadcomplex(tricomplex(bicomplex(point+im*h, h), h), h), h)))/h^5
    return result
end