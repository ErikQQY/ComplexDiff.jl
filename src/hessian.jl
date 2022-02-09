function hessian(fun, x, h)
    values = fun.(x)
    N = length(values)
    M = zeros(N, N)

    for i=1:length(values)
        M[i, i] = image2(fun(bicomplex(x[i]+im*h, h)))/h^2
    end
    return M
end