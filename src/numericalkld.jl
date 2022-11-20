function numericalkld(q::Distribution, logp::Function, numsamples = 10_000, seed = 1)

    rg = MersenneTwister(seed)

    Dkl = 0.0

    @showprogress for __ in 1:numsamples

        x = rand(rg, q)

        Dkl += logpdf(q, x) - logp(x)

    end

    return Dkl / numsamples

end
