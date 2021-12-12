# Principle

The theory in the Complex Step Differentiation is interpolating the equation:

```math
f(x+i\epsilon)=f(x)+i\epsilon f'(x)+O(\epsilon^2)
```

We can get the derivative:

```math
f'(x)=imag(\frac{f(x+i\epsilon)}{\epsilon})
```

See Professor Nick Higham's talk on Juliacon 2018.


<video href="https://www.youtube.com/watch?v=Q9OLOqEhc64" title="JuliaCon 2018"></video>