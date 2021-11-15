function derivative(f, point, h)
    return imag(f(point+im*h))/h
end