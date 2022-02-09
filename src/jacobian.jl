function jacobian(fun, x, h)
    values = fun.(x)
    N = length(values)
    M = zeros(N, N)

    for i=1:length(values)
        M[i, i] = imag(fun(x[i] + im*h))/h
    end
    return M
end