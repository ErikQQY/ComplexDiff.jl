import Base: sin, cos, tan, cot, sec, csc, atan

import Base: sinh, cosh, tanh, coth, sech, csch

import Base: abs, exp, log

import Base: +, -, *, /, ^


struct tricomplex
    i1#::bicomplex
    i2
end



function mat(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    return [i1 -i2; i2 i1]
end

function mat2tricomplex(matrix)
    out1, out2 = matrix[1, 1], matrix[2, 1]
    return tricomplex(out1, out2)
end

## Basic operators: +, -, *, /, ^

function +(tri1::tricomplex, tri2::tricomplex)
    result = mat(tri1)+mat(tri2)
    return mat2tricomplex(result)
end

function +(n, tri::tricomplex)
    result = n .+mat(tri)
    return mat2tricomplex(result)
end

function +(tri::tricomplex, n)
    result = n .+mat(tri)
    return mat2tricomplex(result)
end

function -(tri1::tricomplex, tri2::tricomplex)
    result=mat(tri1)-mat(tri2)
    return mat2tricomplex(result)
end

-(tri::tricomplex)=mat2tricomplex(-mat(tri))

function *(tri1::tricomplex, tri2::tricomplex)
    result=mat(tri1)*mat(tri2)
    return mat2tricomplex(result)
end

function *(n, tri::tricomplex)
    result = n*mat(tri)
    return mat2tricomplex(result)
end

function *(tri::tricomplex, n)
    result = n*mat(tri)
    return mat2tricomplex(result)
end

function /(tri1::tricomplex, tri2::tricomplex)
    result=mat(tri1)-mat(tri2)
    return mat2tricomplex(result)
end

function /(n, tri::tricomplex)
    result=n*inv(mat(tri))
    return mat2tricomplex(result)
end

function /(tri::tricomplex, n)
    result=mat(tri)/n
    return mat2tricomplex(result)
end

function ^(tri::tricomplex, power)
    result=mat(tri)^power
    return mat2tricomplex(result)
end

function zero(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    return tricomplex(zero(i1), zero(i2))
end



function abs(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    return sqrt(i1^2+i2^2)
end

function sin(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    out1 = cosh(i2)*sin(i1)
    out2 = sinh(i2)*cos(i1)
    return tricomplex(out1, out2)
end

function cos(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    out1 = cosh(i2)*cos(i1)
    out2 = -sinh(i2)*sin(i1)
    return tricomplex(out1, out2)
end

function tan(tri::tricomplex)
    return sin(tri)/cos(tri)
end

function cot(tri::tricomplex)
    return cos(tri)/sin(tri)
end

function sec(tri::tricomplex)
    return 1/cos(tri)
end

function csc(tri::tricomplex)
    return 1/sin(tri)
end

## Basic functions: abs, exp, log

function abs(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    return sqrt(i1^2+i2^2)
end

function exp(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    out1 = exp(i1)*cos(i2)
    out2 = exp(i1)*sin(i2)
    return tricomplex(out1, out2)
end

## Basic hyperbolic functions: sinh, cosh, tanh, coth, sech, csch

function sinh(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    out1 = cosh(i1)*cos(i2)
    out2 = sinh(i1)*sin(i2)
    return tricomplex(out1, out2)
end

function cosh(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    out1 = sinh(i1)*cos(i2)
    out2 = cosh(i1)*sin(i2)
    return tricomplex(out1, out2)
end

function tanh(tri::tricomplex)
    return sinh(tri)/cosh(tri)
end

function coth(tri::tricomplex)
    return cosh(tri)/sinh(tri)
end

function sech(tri::tricomplex)
    return 1/cosh(tri)
end

function csch(tri::tricomplex)
    return 1/sinh(tri)
end



function image3(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    return image2(i2)
end

function triderivative(f, point, h)
    result = image3(f(tricomplex(bicomplex(point+im*h, h), h)))/h^3
    return result
end