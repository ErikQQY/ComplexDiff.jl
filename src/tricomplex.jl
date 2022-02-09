import Base: sin, cos, tan, cot, sec, csc, atan
import Base: sinh, cosh, tanh, coth, sech, csch
import Base: abs, exp, log, zero
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

+(tri1::tricomplex, tri2::tricomplex) = mat2tricomplex(mat(tri1)+mat(tri2))
+(n, tri::tricomplex) = mat2tricomplex(n.+mat(tri))
+(tri::tricomplex, n) = +(n, tri)

-(tri1::tricomplex, tri2::tricomplex) = mat2tricomplex(mat(tri1)-mat(tri2))
-(tri::tricomplex)=mat2tricomplex(-mat(tri))

*(tri1::tricomplex, tri2::tricomplex) = mat2tricomplex(mat(tri1)*mat(tri2))
*(n, tri::tricomplex) = mat2tricomplex(n*mat(tri))
*(tri::tricomplex, n) = *(n, tri)

/(tri1::tricomplex, tri2::tricomplex) = mat2tricomplex(mat(tri1)-mat(tri2))
/(n, tri::tricomplex) = mat2tricomplex(n*inv(mat(tri)))
/(tri::tricomplex, n) = mat2tricomplex(mat(tri)/n)

^(tri::tricomplex, power) = mat2tricomplex(mat(tri)^power)

function zero(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    return tricomplex(zero(i1), zero(i2))
end


abs(tri::tricomplex) = sqrt(tri.i1^2 + tri.i2^2)

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

tan(tri::tricomplex) = sin(tri)/cos(tri)
cot(tri::tricomplex) = cos(tri)/sin(tri)
sec(tri::tricomplex) = 1/cos(tri)
csc(tri::tricomplex) = 1/sin(tri)

## Basic functions: abs, exp, log

abs(tri::tricomplex) = sqrt(tri.i1^2 + tri.i2^2)

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

tanh(tri::tricomplex) = sinh(tri)/cosh(tri)
coth(tri::tricomplex) = cosh(tri)/sinh(tri)
sech(tri::tricomplex) = 1/cosh(tri)
csch(tri::tricomplex) = 1/sinh(tri)


function image3(tri::tricomplex)
    i1, i2 = tri.i1, tri.i2
    return image2(i2)
end

function triderivative(f, point, h)
    result = image3(f(tricomplex(bicomplex(point+im*h, h), h)))/h^3
    return result
end