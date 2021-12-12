# High Order Derivative

With Multi-Complex number, we can achieve high order derivative computing.

```math
\mathbb{C}_n=\{\zeta_n=\zeta_{n-1, 1}+\zeta_{n-1, 2}\cdot i_n,\ \zeta_{n-1, 1}, \zeta_{n_1, 2}\in \mathbb{C}_{n-1}  \}
```

$$
f^{(n)}(x)=\frac{imag[f(x+i_1h+i_2h+\cdots+i_nh)]}{h^n}+O(h^2)
$$

By fully utilizing multiple dispatch and operators overloading, we can compute the high order derivative of any analytical functions.