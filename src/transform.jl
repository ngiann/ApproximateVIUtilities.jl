function t2c(lower, upper)
    
    @argcheck lower < upper

    if lower == -Inf && upper == Inf
    
        return identity
    
    end

    if upper == Inf
        
        return x -> softplus(x) + lower
    
    end

    if lower == -Inf
        
        return x -> upper - softplus(-x)

    end

    return x -> logistic(x) * (upper - lower) + lower

end


# analytical derivatives

# dxsigmoid(x) = (1-sigmoid(x)) * sigmoid(x)

# dxt2c(x; lower = lower, upper = upper) = dxsigmoid(x) * (upper - lower)


function convertdensity(logl, lower = lower, upper = upper)

    @assert(length(lower) == length(upper))

    g = [t2c(l, u) for (l, u) in zip(lower, upper)]

    G(X) = map((f,x) -> f(x), g, X)

    logt(X) = logl(G(X))

    jac(X)  = ForwardDiff.jacobian(G, X)

    X -> logt(X) + logdet(jac(X))


    # gdx = [x -> dxt2c(x, l, u) for (l,u) in zip(lower, upper)]

    # jac(X) = map((f,x) -> f(x), gdx, X)
    
    # X -> logt(X) + sum(log.(jac(X))) 

end


function getsamplerbase(q, lower = lower, upper = upper)

    g = [t2c(l, u) for (l, u) in zip(lower, upper)]

    G(X) = map((f,x) -> f(x), g, X)

    () -> G(rand(q))

end