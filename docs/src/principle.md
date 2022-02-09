# Principle

The theory in the Complex Step Differentiation is to use the relationship:

```math
f(x+i\epsilon)=f(x)+i\epsilon f'(x)+O(\epsilon^2)
```

We can get the derivative:

```math
f'(x)=imag(\frac{f(x+i\epsilon)}{\epsilon})
```

See [Professor Nick Higham's talk on Juliacon 2018](https://www.youtube.com/watch?v=Q9OLOqEhc64).

If you are also interested in Complex Step Differentiation, please see the relating papers:
* [Computation of higher-order derivatives using the multi-complex step method](https://folk.ntnu.no/preisig/HAP_Specials/AdvancedSimulation_files/2014/AdvSim-2014__Verheule_Adrian_Complex_differenetiation.pdf)

* [Using Multicomplex Variables for Automatic Computation of High-Order](https://www.researchgate.net/publication/240637774_Using_Multicomplex_Variables_for_Automatic_Computation_of_High-Order_Derivatives)