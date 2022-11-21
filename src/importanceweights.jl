function importanceweights(q, logp, numsamples)

    logω = zeros(numsamples)

    X = rand(q, numsamples)
  
    
    @showprogress "Computing importance weights..." for i in 1:numsamples

        logω[i] = logp(X[:,i]) - logpdf(q, X[:,i])

    end

    aux = exp.(logω .- logsumexp(logω))

    return X, aux / sum(aux) # numerics

 end


 function getISmultinomial(q, logp, numsamples)

    X, w = importanceweights(q, logp, numsamples)

    c = Categorical(w)
    
    getsample() = X[:,rand(c)]

    getsample(N) = X[:,rand(c, N)]

    return getsample

 end